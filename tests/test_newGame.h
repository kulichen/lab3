#include <gtest/gtest.h>
#include "helper.h"

//позитивный тест
TEST(newGame, lvl1) {
    Helper helper;

    for (int i = 1; i <= 6; i++){
        QVector<int> res = helper.newGame(i);
        EXPECT_EQ(res, helper.startconfig[i]);
    }
}

//негативный тест
TEST(newGame, lvl7) {
    Helper helper;

    bool res = helper.startconfig.contains(7);

    EXPECT_EQ(res, false);
}
