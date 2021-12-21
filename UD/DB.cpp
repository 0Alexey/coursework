#include "DB.h"
/**********************DB***********************/
MYSQL* DB::connection;
std::string DB::host = "localhost";
unsigned int DB::port = 3306;
std::string DB::user = "root";
std::string DB::password = "12345";
std::string DB::dbname = "retailchain";
bool DB::start() {
	connection = mysql_init(nullptr);
	if (mysql_real_connect(connection, host.c_str(), user.c_str(), password.c_str(), dbname.c_str(), port, nullptr, 0) == nullptr)
	{
		mysql_error(connection);
		return false;
	}
	mysql_query(connection, "set names cp1251");
	return true;
}
void DB::stop() { mysql_close(connection); }
std::string DB::mysqlError() { return mysql_error(connection); }
MYSQL_RES* DB::sendReq(std::string req) {
	if (mysql_query(connection, req.c_str())) { std::cout << "Пришел пустой ответ\n"; return nullptr; }
	return mysql_store_result(connection);
}
void DB::printLine(std::vector<int> sizes)
{
	for (size_t i = 0; i < sizes.size(); i++)
	{
		std::cout << '+';
		for (size_t j = 0; j < sizes[i]; j++) std::cout << '-';
	}
	std::cout << "+\n";
}
void DB::PrintAnswer(MYSQL_RES* res)
{
	if (res == nullptr) return;
	int num_fields = mysql_num_fields(res);
	MYSQL_ROW row;
	MYSQL_FIELD* field;
	std::vector<int> lengthHeader;
	int TotalLength = 0;
	std::cout << "|";
	while (field = mysql_fetch_field(res))
	{
		lengthHeader.push_back(max(field->max_length, field->name_length));
		std::cout << std::setw(lengthHeader.back()) << std::left << field->name << "|";
		TotalLength += lengthHeader.back() + 1;
	}
	std::cout << "\n";
	printLine(lengthHeader);
	while ((row = mysql_fetch_row(res))) {
		std::cout << "|";
		for (int i = 0; i < num_fields; i++) std::cout << std::setw(lengthHeader[i]) << std::left << (row[i] ? row[i] : "NULL") << '|';
		std::cout << "\n";
	}
	printLine(lengthHeader);
}
std::vector<int> DB::GetVectorInt(std::string req)
{
	MYSQL_RES* res = sendReq(req);
	std::vector<int> Res;
	if (res == nullptr) return Res;
	int num_fields = mysql_num_fields(res);
	MYSQL_ROW row;
	while ((row = mysql_fetch_row(res))) Res.push_back(atoi(row[0]));
	return Res;
}
int NextInt()
{
	int x;
	std::cin >> x;
	std::cin.ignore();
	return x;
}
std::string NextString()
{
	std::string Line;
	std::getline(std::cin, Line);
	return Line;
}