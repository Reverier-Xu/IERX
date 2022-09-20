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
    return m_tips;
}

int LauncherDataPrivate_::progress() const {
    return m_progress;
}

void LauncherDataPrivate_::setTips(QString tips) {
    if (m_tips == tips)
        return;

    m_tips = std::move(tips);
    emit tipsChanged(m_tips);
}

void LauncherDataPrivate_::setProgress(int progress) {
    if (m_progress == progress)
        return;

    m_progress = progress;
    emit progressChanged(m_progress);
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
