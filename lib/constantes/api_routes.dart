// lib/constants/api_routes.dart

class ApiRoutes {
  static const String LOGIN = "/auth/login/";
  static const String LOGOUT = "/auth/logout/";
  static const String ME = "/me/";
  static const String USER = "/users/";
  static const String USER_FULLLIST = "/users/FullList";
  static const String PERMISSION = "/users/permissions_visible/";
  static const String PERMISSION_USER = "/users/add_permissions_to_user/";
  static const String PERMISSION_GROUP = "/users/add_permissions_to_group/";
  static const String ROL = "/roles/";
  static const String ROL_FULLLIST = "/roles/FullList";
  static const String ACCOUNT = "/account/account/";
  static const String ACCOUNT_FULLLIST = "/account/account/FullList";
  static const String CAMPAIGN = "/campaign/campaign/";
  static const String CAMPAIGN_FULLLIST = "/campaign/campaign/FullList/";
  static const String AUDITS = "/audits/audits/";
  static const String AUDITS_FULLLIST = "/audits/audits/FullList";
  static const String LOTE = "/lote/lote/";
  static const String LOTE_FULLLIST = "/lote/lote/FullList";
  static const String LEADS = "/leads/leads/";
  static const String LEADS_FULLLIST = "/leads/leads/FullList";
  static const String CASOS = "/casos/casos/";
  static const String CASOS_FULLLIST = "/casos/casos/FullList";
  static const String DASHBOARD = "/dashboard/";
  static const String CONTACTS = "/contact/contacto/";
  static const String CONTACTS_GET_USER = "/contact/contacto/get_contact_user/";
  static const String CONTACTS_FULLLIST = "/contact/contacto/FullList";
  static const String CONTACTS_DATA = "/contact/datoContacto/";
  static const String CONTACTS_DATA_FULLLIST = "/contact/datoContacto/FullList";
  static const String CONTACTS_DOCUMENT = "/contact/documentoContacto/";
  static const String CONTACTS_DOCUMENT_FULLLIST = "/contact/documentoContacto/FullList";
  static const String CONTACTS_AGENT = "/contact/contacto/get_contact_agent/";

  // GESTION CONTACTO
  static const String CALIFICACION_CONTACTO = "/contact/calificacionContacto/";
  static const String CALIFICACION_CONTACTO_LISTA = "/contact/calificacionContacto/FullList";
  static const String DESCRIPCION_CALIFICACION = "/contact/descripcionCalificacion/";
  static const String DESCRIPCION_CALIFICACION_LISTA = "/contact/descripcionCalificacion/FullList";
  static const String TIPO_GESTION_CONTACTO = "/contact/tipoGestion/";
  static const String TIPO_GESTION_CONTACTO_LISTA = "/contact/tipoGestion/FullList";
  static const String GESTION_CONTACTO = "/contact/gestionContacto/";
  static const String GESTION_CONTACTO_FULLLIST = "/contact/gestionContacto/FullList";

  // HOJA DE VIDA
  static const String HOJA_CONTACTO = "/contact/hoja_contacto/";
  static const String EXPERIENCIA_HOJA = "/contact/experiencia_hoja/";
  static const String EDUCACION_HOJA = "/contact/educacion_hoja/";
  static const String CONOCIMIENTO_HOJA = "/contact/conociminetos_hoja/";

  // CALENDAR
  static const String CALENDAR_EVENT = "/calendar/event/";
  static const String CALENDAR_GESTION = "/calendar/gestion_event/";

  // Tasks
  static const String TASKS = "/calendar/tasks/";

  // SURVEY
  static const String SURVEY = "/survey/survey/";
  static const String SURVEY_QUESTION = "survey/survey_questions/";
  static const String SURVEY_ASSIGN = "/survey/survey_schedule/";
  static const String WHATHSAPP_CHAT = "whatsapp/message/contact_messages";

  // CONVERSATIONS
  static const String CONVERSATIONS = "whatsapp/conversation/";

  // Pisos
  static const String PISO = "/hc/floor/";
  static const String PISO_FULLLIST = "/hc/floor/FullList";

  // Areas
  static const String AREAS = "/hc/areas/";
  static const String AREAS_FULLLIST = "/hc/areas/FullList";

  // Room
  static const String ROOM = "/hc/room/";
  static const String ROOM_FULLLIST = "/hc/room/FullList";

  // Patient
  static const String PATIENT = "/hc/patient/";

  // Desinfeccion
  static const String DESINFECCION = "/hc/disinfection/";
}
