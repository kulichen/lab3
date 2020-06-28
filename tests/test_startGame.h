#include <gtest/gtest.h>
#include "helper.h"

//позитивный тест
TEST(startGame, lvl1) {
    Helper helper;

    for (int i = 1; i <= 6; i++){
        QVector<int> res = helper.startGame(i);
        EXPECT_EQ(res, helper.finalconfig[i]);
    }
}

//негативный тест
TEST(startGame, lvl7) {
    Helper helper;

    bool res = helper.finalconfig.contains(7);

    EXPECT_EQ(res, false);
}
