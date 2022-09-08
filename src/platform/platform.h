/**
 * @file platform.h
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-07
 *
 * @copyright 2022 Woo Tech
 */

#pragma once
#include <QObject>


class QQmlEngine;

class QQmlComponent;

class QQuickWindow;

namespace IERX {

class Project;

class PlatformDataPrivate_ : public QObject {
   Q_OBJECT
   public:
    Q_INVOKABLE void requestQuit();

   signals:

    void quitRequested();
};

class Platform : public QObject {
   Q_OBJECT
   private:
    QQmlEngine* mUiEngine;

    QQmlComponent* mUiComponent;

    QQuickWindow* mWindow{};

    PlatformDataPrivate_* mData{};

    Project* m_project;

   public:
    explicit Platform(QObject* parent = nullptr);

    ~Platform() override;

    void initialize();

    void show();

    void handleQuit();

   signals:

    void initStateChanged(QString tips, int progress);
};

}
