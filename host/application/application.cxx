/**
 * @file application.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */


#include "application.h"
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtConcurrent>
#include "launcher.h"
#include "platform.h"


namespace IERX {
Application::Application(QObject* parent) : QObject(parent) {
    m_translator = new QTranslator(this);
    auto _ = m_translator->load(QStringLiteral(":/i18n/zh_CN.qm"));
    QApplication::installTranslator(m_translator);

    m_launcher = new Launcher(this);
    m_platform = new Platform(this);
}

Application::~Application() = default;

void Application::initialize() {
    m_launcher->show();
    connect(m_platform, &Platform::initStateChanged, [=](const QString& tips, int progress) {
        m_launcher->setTips(tips);
        m_launcher->setProgress(progress);
    });
    auto initPromise = QtConcurrent::run([=]() {
        m_platform->initialize();
    });
    auto initWatcher = new QFutureWatcher<void>(this);
    initWatcher->setFuture(initPromise);
    connect(initWatcher, &QFutureWatcher<void>::finished, [=]() {
        initWatcher->deleteLater();
        m_launcher->finish();
        m_platform->show();
    });
}

} // namespace IERX
