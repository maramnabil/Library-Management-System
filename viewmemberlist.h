#ifndef VIEWMEMBERLIST_H
#define VIEWMEMBERLIST_H

#include <QMainWindow>
#include <QtSql>
#include <QDebug>
#include <QFileInfo>
#include "finalmember.h"
#include "editmember.h"

namespace Ui {
class Viewmemberlist;
}

class Viewmemberlist : public QMainWindow
{
    Q_OBJECT

public:
    explicit Viewmemberlist(QWidget *parent = nullptr);
    ~Viewmemberlist();

signals:
    void sendData(QStringList);

private slots:
    void on_pushButton_clicked();

    void on_pushButton_return_clicked();

    void on_tableView_clicked(const QModelIndex &index);

    void on_pushButton_deletemember_clicked();

    void on_pushButton_editMember_clicked();

    void on_pushButton_refresh_clicked();

public:
    QSqlDatabase myDB;

private:
    Ui::Viewmemberlist *ui;
    Finalmember *finalmember;
    EditMember *editmember;
};

#endif // VIEWMEMBERLIST_H
