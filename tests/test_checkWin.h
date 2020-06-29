#include <gtest/gtest.h>
#include "helper.h"

TEST(checkWin, lvl_win) {
    Helper helper;

    for(int i = 1; i <= 6; i++) {
        bool res = helper.checkWin(helper.finalconfig[i], i);
        EXPECT_EQ(res, true);
    }
}


TEST(checkWin, lvl_lose1) {
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



TEST(checkWin, lvl_lose2) {
    Helper helper;

    QVector<int> lose_config;
    lose_config.append(3);
    for(int i = 1; i < 100; i++) {
        lose_config.append(0);
    }

    for(int i = 1; i <= 6; i++) {
        bool res = helper.checkWin(lose_config, i);
        EXPECT_EQ(res, false);
    }
}
