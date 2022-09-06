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

IERXApp::IERXApp(QObject *parent) : QObject(parent) {
    mLauncher = new Launcher(this);
}

IERXApp::~IERXApp() = default;

void IERXApp::initialize() {
    mLauncher->show();
    auto res = QtConcurrent::run([this]() {
        for (int i = 0; i < 11; ++i) {
            QThread::sleep(1);
            this->mLauncher->setProgress(i * 10);
        }
        QThread::sleep(1);
        return;
    });
    auto *resWatcher = new QFutureWatcher<void>(this);
    resWatcher->setFuture(res);
    connect(resWatcher, &QFutureWatcher<void>::finished, [=]() {
        mLauncher->finish();
        resWatcher->deleteLater();
    });
}
