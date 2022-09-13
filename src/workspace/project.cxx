/**
 * @file project.cxx
 * @author Reverier-Xu (reverier.xu[at]woooo.tech)
 * @brief 
 * @version 0.1.0
 * @date 2022-09-08
 *
 * @copyright 2022 Woo Tech
 */

#include "project.h"


namespace IERX {

Project::Project(QObject* parent) : QObject(parent) {
    m_name = tr("No Active Project");
}

Project::~Project() = default;

QString Project::name() const {
    return m_name;
}

QString Project::path() const {
    return m_path;
}

QString Project::description() const {
    return m_description;
}

void Project::setName(QString name) {
    if (m_name == name)
        return;

    m_name = std::move(name);
    emit nameChanged(m_name);
}

void Project::setPath(QString path) {
    if (m_path == path)
        return;

    m_path = std::move(path);
    emit pathChanged(m_path);
}

void Project::setDescription(QString description) {
    if (m_description == description)
        return;

    m_description = std::move(description);
    emit descriptionChanged(m_description);
}

bool Project::available() const {
    return m_available;
}

void Project::setAvailable(bool available) {
    if (m_available == available)
        return;

    m_available = available;
    emit availableChanged(m_available);
}

}
