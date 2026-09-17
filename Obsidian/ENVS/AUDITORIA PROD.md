


```
# ==============================================
# SEGURIDAD
# ==============================================
JWT_SECRET=MiaTechJWTSecretKey2024ReportesAuditoriaDevelopment
AES_KEY=MiaTech2024ReportesAuditoria32XY
SECRET_KEY=dev-secret-key-flask-2024

# ==============================================
# APLICACIÓN
# ==============================================
FLASK_ENV=development
FLASK_DEBUG=True
CORS_ORIGINS=*
API_PREFIX=/api/v1
APP_ENV=production

# ==============================================
# JWT
# ==============================================
JWT_EXPIRATION_MINUTES=30
JWT_ALGORITHM=HS256

# ==============================================
# BASE DE DATOS
# ==============================================
DB_DRIVER=IBM i Access ODBC Driver
DB_SYSTEM=10.19.17.25
BATCH_LOG_RETENTION_DAYS=7

# ==============================================
# PROCESO AUDITORIA (CLPSAUDIT)
# ==============================================
CLPSAUDIT_JOBQ=LIBMIA/COLA7


# ==============================================
# CORREO
# ==============================================
SMTP_SERVER=smtp-mail.outlook.com
SMTP_PORT=587
MAIL_FROM=notificaciones@miatech.net
MAIL_PASSWORD=Notific@ciones
CORREO_OPERACIONES=ppimentel@miatech.net,yadira@miatech.net

# ==============================================
# URLS
# ==============================================
API_BASE_URL=https://salesaudit.miatech.net
WEB_URL=salesaudit.miatech.net
NEXT_PUBLIC_API_URL_LOCAL=https://salesaudit.miatech.net/api/v1
NEXT_PUBLIC_API_URL_DEV=https://salesaudit.miatech.net/api/v1
NEXT_PUBLIC_API_URL_PROD=https://salesaudit.miatech.net/api/v1

# ==============================================
# TOKENS FRONTEND
# ==============================================
TEMP_KEY_SECRET_LOCAL=bfevreiwS8tvORtBAJrexkt0zIA+fTAyBbJX9
TEMP_KEY_SECRET_DEV=bfevreiwS8tvORtBAJrexkt0zIA+fTAyBbJX9
TEMP_KEY_SECRET_PROD=bfevreiwS8tvORtBAJrexkt0zIA+fTAyBbJX9
AUTH_TOKEN_LOCAL=MiaTech2024ReportesAuditoria32XY
AUTH_TOKEN_DEV=MiaTech2024ReportesAuditoria32XY
AUTH_TOKEN_PROD=MiaTech2024ReportesAuditoria32XY

# ==============================================
# GUNICORN
# ==============================================
GUNICORN_WORKERS=1
GUNICORN_LOG_LEVEL=info
GUNICORN_ACCESS_LOG=-
GUNICORN_ERROR_LOG=-

# ==============================================
# SMB
# ==============================================
SMB_HOST=10.0.0.83
SMB_USER=ppimentel
SMB_PASSWORD=Jaredcito2025
SMB_DOMAIN=miatech.net
SMB_SHARE=am

# ==============================================
# ATPCO - CARRIER
# ==============================================
ATPCO_OUTPUT_DIR=output/atpco
ATPCO_FARE_CARRIER_START=3
ATPCO_FARE_CARRIER_LENGTH=2
ATPCO_ALLFTNTS_CARRIER_START=3,5,11
ATPCO_ALLFTNTS_CARRIER_LENGTH=2
ATPCO_ALLRULES_CARRIER_START=3,5,11
ATPCO_ALLRULES_CARRIER_LENGTH=2
ATPCO_INTFTNTS_CARRIER_START=3,5,11
ATPCO_INTFTNTS_CARRIER_LENGTH=2
ATPCO_INTRULES_CARRIER_START=3,5,11
ATPCO_INTRULES_CARRIER_LENGTH=2

# ==============================================
# ATPCO - EXTRACCIÓN
# ==============================================
ATPCO_EXTRACT_ENABLED=true
ATPCO_EXTRACT_RECORDS=0,1,2,3,4,5,6,7,8
ATPCO_ROCKSDB_DIR=data/atpco_rocksdb
ATPCO_INDEX_ENABLED=true
ATPCO_INDEX_FALLBACK_SMB=true
ATPCO_INDEX_BACKFILL_MIN_YEAR=2014

# ==============================================
# MEDIOS DE PAGO
# ==============================================
REPORT_MP_OUTPUT_DIR=W:\
REPORT_MP_OUTPUT_MODE=auto
REPORT_MP_SMB_HOST=wsfile
REPORT_MP_SMB_SHARE=work
REPORT_MP_CHUNK_SIZE=5000
REPORT_MP_MAX_WORKERS=3
REPORT_MP_MAX_DATE_RANGE_DAYS=10000

```
