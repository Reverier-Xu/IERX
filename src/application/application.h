/**
 * @file application.h
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

class Application : public QObject {
   Q_OBJECT
   private:
    Launcher* mLauncher;

    Platform* mPlatform;

    QTranslator* mTranslator;

   public:
    explicit Application(QObject* parent = nullptr);

    ~Application() override;

    void initialize();
};

} // namespace IERX
