#include "test_checkWin.h"
#include "test_newGame.h"
#include "test_startGame.h"
#include <gtest/gtest.h>

int main(int argc, char *argv[])
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
