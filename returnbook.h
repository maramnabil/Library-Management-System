#ifndef RETURNBOOK_H
#define RETURNBOOK_H

#include <QMainWindow>
#include <QtSql>
#include <QDebug>
#include <QFileInfo>

namespace Ui {
class Returnbook;
}

class Returnbook : public QMainWindow
{
    Q_OBJECT

public:
    explicit Returnbook(QWidget *parent = nullptr);
    ~Returnbook();

private slots:
    void on_pushButton_returnToHome_clicked();

private:
    Ui::Returnbook *ui;
};

#endif // RETURNBOOK_H
