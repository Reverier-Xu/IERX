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

class QTimer;

namespace IERX {

class Project;

class PlatformDataPrivate_ : public QObject {
   Q_OBJECT
    Q_PROPERTY(quint64 memoryUsed READ memoryUsed WRITE setMemoryUsed NOTIFY memoryUsedChanged)
    Q_PROPERTY(quint64 memoryTotal READ memoryTotal WRITE setMemoryTotal NOTIFY memoryTotalChanged)
    Q_PROPERTY(quint64 diskUsed READ diskUsed WRITE setDiskUsed NOTIFY diskUsedChanged)
    Q_PROPERTY(quint64 diskTotal READ diskTotal WRITE setDiskTotal NOTIFY diskTotalChanged)

   public:
    [[nodiscard]] quint64 memoryUsed() const;
    [[nodiscard]] quint64 memoryTotal() const;
    [[nodiscard]] quint64 diskUsed() const;
    [[nodiscard]] quint64 diskTotal() const;
    void setMemoryUsed(quint64 n);
    void setMemoryTotal(quint64 n);
    void setDiskUsed(quint64 n);
    void setDiskTotal(quint64 n);


   public slots:
    Q_INVOKABLE void requestQuit();

   signals:
    void quitRequested();
    void memoryUsedChanged(quint64 n);
    void memoryTotalChanged(quint64 n);
    void diskUsedChanged(quint64 n);
    void diskTotalChanged(quint64 n);
};

class Platform : public QObject {
   Q_OBJECT
   private:
    QQmlEngine* m_uiEngine;

    QQmlComponent* m_uiComponent;

    QQuickWindow* m_window{};

    PlatformDataPrivate_* m_data{};

    Project* m_project;

    QTimer* m_sysinfoTimer;

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
