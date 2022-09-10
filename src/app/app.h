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

class QTranslator;

namespace IERX {
class Launcher;

class Platform;

class App : public QObject {
   Q_OBJECT
   private:
    Launcher* mLauncher;

    Platform* mPlatform;

    QTranslator* mTranslator;

   public:
    explicit App(QObject* parent = nullptr);

    ~App() override;

    void initialize();
};

} // namespace IERX
