/**
 * @file sysinfo.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-14
 *
 * @copyright 2022 Woo Tech
 */

#include "systeminfo.h"

#include <QtGlobal>
#ifdef Q_OS_WIN
#include <windows.h>
#endif
#ifdef Q_OS_MAC
#include <mach/vm_statistics.h>
#include <mach/mach_types.h>
#include <mach/mach_init.h>
#include <mach/mach_host.h>
#include <mach/vm_map.h>
#endif
#ifdef Q_OS_LINUX
#include <sys/sysinfo.h>
#include <QStorageInfo>


#endif

namespace IERX {

quint64 SystemInfo::availableMemory() {
#ifdef Q_OS_WIN
    MEMORYSTATUSEX memoryStatus;
    memoryStatus.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memoryStatus);
    return memoryStatus.ullAvailPhys;
#endif
#ifdef Q_OS_MAC
    vm_size_t pageSize;
    vm_statistics64_data_t vmStats;
    mach_port_t machPort = mach_host_self();
    mach_msg_type_number_t count = sizeof(vmStats) / sizeof(natural_t);
    host_page_size(machPort, &pageSize);
    host_statistics64(machPort, HOST_VM_INFO, (host_info64_t)&vmStats, &count);
    quint64 freeMemory = (int64_t)vmStats.free_count * (int64_t)pageSize;
    return freeMemory;
#endif
#ifdef Q_OS_LINUX
    struct sysinfo memInfo{};
    sysinfo(&memInfo);
    return (memInfo.freeram + memInfo.freeswap) * memInfo.mem_unit;
#endif
}

quint64 SystemInfo::totalMemory() {
#ifdef Q_OS_WIN
    MEMORYSTATUSEX memoryStatus;
    memoryStatus.dwLength = sizeof(MEMORYSTATUSEX);
    GlobalMemoryStatusEx(&memoryStatus);
    return memoryStatus.ullTotalPhys;
#endif
#ifdef Q_OS_MAC
    vm_size_t pageSize;
    vm_statistics64_data_t vmStats;
    mach_port_t machPort = mach_host_self();
    mach_msg_type_number_t count = sizeof(vmStats) / sizeof(natural_t);
    host_page_size(machPort, &pageSize);
    host_statistics64(machPort, HOST_VM_INFO, (host_info64_t)&vmStats, &count);
    quint64 freeMemory = (int64_t)vmStats.free_count * (int64_t)pageSize;
    qulonglong totalMemoryUsed = ((int64_t)vmStats.active_count + (int64_t)vmStats.inactive_count +
    (int64_t)vmStats.wire_count)* (int64_t)pageSize;
    quint64 totalMemory = freeMemory + totalMemoryUsed;
    return totalMemory;
#endif
#ifdef Q_OS_LINUX
    struct sysinfo memInfo{};
    sysinfo(&memInfo);
    qulonglong totalMemory = memInfo.totalram;
    totalMemory += memInfo.totalswap;
    totalMemory *= memInfo.mem_unit;
    return totalMemory;
#endif
}

quint64 SystemInfo::availableDiskSpace() {
    auto storage = QStorageInfo(".");
    return storage.bytesAvailable();
}

quint64 SystemInfo::totalDiskSpace() {
    auto storage = QStorageInfo(".");
    return storage.bytesTotal();
}

}
