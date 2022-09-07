/**
 * @file app.h
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */

#pragma once

#include <QObject>


class Launcher;
class Platform;

class IERXApp : public QObject {
    Q_OBJECT
    private:
    Launcher *mLauncher;
    Platform *mPlatform;

    public:
    explicit IERXApp(QObject *parent = nullptr);
    ~IERXApp() override;
    void initialize();
};
