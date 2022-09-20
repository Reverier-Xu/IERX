/**
 * @file sysinfo.h
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-14
 *
 * @copyright 2022 Woo Tech
 */

#pragma once

#include <QObject>


namespace IERX {

class SystemInfo {
   public:
    static quint64 totalMemory();

    static quint64 availableMemory();

    static quint64 availableDiskSpace();

    static quint64 totalDiskSpace();
};

}
