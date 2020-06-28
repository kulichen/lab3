#include <gtest/gtest.h>
#include "helper.h"

//позитивный тест
TEST(checkWin, lvl_win) {
    Helper helper;

    for(int i = 1; i <= 6; i++) {
        bool res = helper.checkWin(helper.finalconfig[i], i);
        EXPECT_EQ(res, true);
    }
}

//негативный тест
TEST(checkWin, lvl_lose) {
    Helper helper;

    QVector<int> lose_config;
    for(int i = 0; i < 100; i++) {
        lose_config.append(-1);
    }

    for(int i = 1; i <= 6; i++) {
        bool res = helper.checkWin(lose_config, i);
        EXPECT_EQ(res, false);
    }
}
