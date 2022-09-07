/**
 * @file launcher.h
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief
 * @version 0.1.0
 * @date 2022-09-06
 *
 * @copyright 2022 Woo Tech
 */

#pragma once
#include <QObject>

class QQmlEngine;
class QQmlComponent;
class QQuickWindow;

class LauncherDataPrivate_ : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString tips READ tips WRITE setTips NOTIFY tipsChanged)
    Q_PROPERTY(int progress READ progress WRITE setProgress NOTIFY progressChanged)

    private:
    QString mTips{};
    int mProgress{};

    public:
    [[nodiscard]] QString tips() const;

    [[nodiscard]] int progress() const;

    public slots:
    Q_INVOKABLE void setTips(QString tips);

    Q_INVOKABLE void setProgress(int progress);

    signals:
    void tipsChanged(QString tips);

    void progressChanged(int progress);
};

class Launcher : public QObject {
    Q_OBJECT

    private:
    QQmlEngine *mUiEngine;
    QQmlComponent *mUiComponent;
    QQuickWindow *mWindow{};
    LauncherDataPrivate_ *mData{};

    public:
    explicit Launcher(QObject *parent = nullptr);

    ~Launcher() override;

    void show();

    void finish();

    void setTips(const QString& tips);

    void setProgress(int progress);

};
