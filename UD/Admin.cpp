#include "Admin.h"

void AddProduct()
{
	std::cout << "Введите название товара\n" << std::endl;
	std::string Name = NextString();
	std::cout << "Введите сорт товара\n" << std::endl;
	std::string Sort = NextString();
	std::cout << "Введите цену\n" << std::endl;
	std::string Cost = NextString();
	DB::sendReq("INSERT INTO Товары VALUES("ывфывф", "adaw",50 )");
	//DB::sendReq("INSERT INTO Товары VALUES('" + Name + "', '" + Sort + "', " + Cost + ")");
	DB::PrintAnswer(DB::sendReq("SELECT * FROM `торговые базы`"));
	std::cout << "Введите номер базы, на которую следует доставить товар\n" << std::endl;
	std::string Base = NextString();
	std::cout << "Введите количество товара\n" << std::endl;
	std::string Count = NextString();
	DB::sendReq("INSERT INTO `товары на базах` VALUES('" + Name + "', '" + Count + "', " + Base + ")");
}

void CloseDepartment()
{
	DB::PrintAnswer(DB::sendReq("SELECT * FROM Отделы"));
	std::cout << "Введите ID отдела\n" << std::endl;
	std::string ID = NextString();
	DB::sendReq("DELETE FROM Отделы WHERE ID = " + ID);
}
void ChangeCost()
{
	DB::PrintAnswer(DB::sendReq("SELECT * FROM Товары"));
	std::cout << "Введите ID товара\n" << std::endl;
	std::string ID = NextString();
	std::cout << "Введите цену\n" << std::endl;
	std::string Cost = NextString();
	DB::sendReq("UPDATE товары SET Цена=" + Cost + " WHERE ID = " + ID);
}

int Admin()
{
	std::cout << 
"Введите номер пункта меню:\n\
0) Выход\n\
1) Закупка нового товара\n\
2) Закрытие отдела в магазине\n\
3) Изменение цены товара\n";
	switch (NextInt())
	{
	case 0: return EXIT; break;
	case 1: AddProduct(); break;
	case 2: CloseDepartment(); break;
	case 3: ChangeCost(); break;
	default: std::cout << "Нет такого пункта" << std::endl; break;
	}
}