#include "CustomEngine.h"

CustomEngine::CustomEngine(QObject *parent) :
    QQmlApplicationEngine(parent)
{
#if !defined(__wasm__) && defined(QT_DEBUG)
    m_fileWatcher = new FileWatcher(this);

    QObject::connect(m_fileWatcher, &FileWatcher::reloadUI, this, &CustomEngine::reloadUI);
#endif
}

void CustomEngine::clearCache()
{
    this->clearComponentCache();
}
