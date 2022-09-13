/**
 * @file launcher.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */

#include "launcher.h"
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QQuickWindow>


namespace IERX {
QString LauncherDataPrivate_::tips() const {
    return mTips;
}

int LauncherDataPrivate_::progress() const {
    return mProgress;
}

void LauncherDataPrivate_::setTips(QString tips) {
    if (mTips == tips)
        return;

    mTips = std::move(tips);
    emit tipsChanged(mTips);
}

void LauncherDataPrivate_::setProgress(int progress) {
    if (mProgress == progress)
        return;

    mProgress = progress;
    emit progressChanged(mProgress);
}

Launcher::Launcher(QObject* parent) : QObject(parent) {
    mData = new LauncherDataPrivate_();
    mData->setParent(this);
    mUiEngine = new QQmlEngine(this);
    mUiEngine->rootContext()->setContextProperty("launcher", mData);
    mUiEngine->retranslate();
    mUiComponent = new QQmlComponent(mUiEngine, this);
    mUiComponent->loadUrl(QUrl(QStringLiteral("qrc:/launcher/ui/Launcher.qml")));
    mWindow = qobject_cast<QQuickWindow*>(mUiComponent->create());
}

Launcher::~Launcher() = default;

void Launcher::show() {
    mWindow->show();
    mData->setTips(tr("Loading..."));
}

void Launcher::finish() {
    mWindow->close();
    mWindow->deleteLater();
    mUiComponent->deleteLater();
    mUiEngine->deleteLater();
}

void Launcher::setProgress(int progress) {
    mData->setProgress(progress);
}

void Launcher::setTips(const QString& tips) {
    mData->setTips(tips);
}

}
