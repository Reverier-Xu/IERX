/**
 * @file app.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */


#include "app.h"
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtConcurrent>
#include "launcher.h"
#include "platform.h"

IERXApp::IERXApp(QObject *parent) : QObject(parent) {
    mLauncher = new Launcher(this);
    mPlatform = new Platform(this);
}

IERXApp::~IERXApp() = default;

void IERXApp::initialize() {
    mLauncher->show();
    connect(mPlatform, &Platform::initStateChanged, [=](const QString& tips, int progress){
        mLauncher->setTips(tips);
        mLauncher->setProgress(progress);
    });
    auto initPromise = QtConcurrent::run([=](){
        mPlatform->initialize();
    });
    auto initWatcher = new QFutureWatcher<void>(this);
    initWatcher->setFuture(initPromise);
    connect(initWatcher, &QFutureWatcher<void>::finished, [=](){
        initWatcher->deleteLater();
        mLauncher->finish();
        mPlatform->show();
    });
}
