/**
 * @file project.h
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-08
 *
 * @copyright 2022 Woo Tech
 */

#pragma once

#include <QObject>

namespace IERX {
class Project : public QObject {
   Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString path READ path WRITE setPath NOTIFY pathChanged)
    Q_PROPERTY(QString description READ description WRITE setDescription NOTIFY descriptionChanged)
    Q_PROPERTY(bool available READ available WRITE setAvailable NOTIFY availableChanged)

   private:
    QString m_name;

    QString m_path;

    QString m_description;

    bool m_available{};

   public:
    explicit Project(QObject* parent = nullptr);

    ~Project() override;

    [[nodiscard]] QString name() const;

    [[nodiscard]] QString path() const;

    [[nodiscard]] QString description() const;

    [[nodiscard]] bool available() const;

   public slots:
    Q_INVOKABLE void setName(QString name);

    Q_INVOKABLE void setPath(QString path);

    Q_INVOKABLE void setDescription(QString description);

    Q_INVOKABLE void setAvailable(bool available);

   signals:

    void nameChanged(QString name);

    void pathChanged(QString path);

    void descriptionChanged(QString description);

    void availableChanged(bool available);
};

}
