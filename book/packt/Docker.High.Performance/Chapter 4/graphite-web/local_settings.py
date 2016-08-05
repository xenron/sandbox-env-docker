import os
CARBONLINK_HOSTS = ['carbon:7002'] # --link-from carboncache:carbon
WHISPER_DIR = '/whisper'           # --volumes-from whisper

GRAPHITE_ROOT = '/graphite'
SECRET_KEY = os.environ.get('SECRET_KEY', 'replacekey')
LOG_RENDERING_PERFORMANCE = False
LOG_CACHE_PERFORMANCE = False
LOG_METRIC_ACCESS = False
LOG_DIR = '/var/log/graphite'
