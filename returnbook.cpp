#include "returnbook.h"
#include "ui_returnbook.h"
#include "homepage.h"
#include <QMessageBox>
Homepage *h4;

Returnbook::Returnbook(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Returnbook)
{
    ui->setupUi(this);
    QSqlDatabase myDB = QSqlDatabase::addDatabase("QSQLITE");
    QString database_path= QCoreApplication::applicationDirPath() + "/library_system.db";
    myDB.setDatabaseName(database_path);
    if(!myDB.open()){
         QMessageBox::warning(this,"Problem in database", "Failed to open the database.");
    }
    QSqlQueryModel *modal = new QSqlQueryModel();
    QSqlQuery *qry = new QSqlQuery(myDB);
    qry->prepare("select * from borrow");
    qry->exec();
    modal->setQuery(*qry);
    ui->tableView->setModel(modal);
}

Returnbook::~Returnbook()
{
    delete ui;
}

void Returnbook::on_pushButton_returnToHome_clicked()
{
    h4 = new Homepage(this);
    h4->show();
    hide();
}

