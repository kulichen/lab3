#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QDebug>
#include <QVector>
#include <QMap>

class Helper : public QObject
{
    Q_OBJECT
public:
    explicit Helper(QObject *parent = nullptr);
    QMap<int, QVector<int> > finalconfig;
    QMap<int, QVector<int> > startconfig;

signals:

public slots:
    QVector<int> newGame(int);
    QVector<int> startGame(int);
    bool checkWin(QVector<int> configs, int);
};

#endif // HELPER_H
