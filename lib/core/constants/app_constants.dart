class AppConstants {
  // base url api
  static const String baseUrl = 'https://micita.onrender.com/api';
  // end points
  // Auth (usuario)
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/registro';
  // categorias:
  // negocio:
  static const String categoriasNegocioEndpoint  = '/categorias-negocio'; // obtener - crear
  // servicio:
  static const String categoriasServicioEndpoint = '/categorias-servicio'; // obtener por categoria negocioId - id
  //____________________________________________
  //servicio
  static const String servicioEndpoint = '/servicios'; //crear
  //negocio
  static const String negocioEndpoint = '/negocios'; // crear

  static const String tokenKey = 'auth_token';
  static const String userEmailKey = 'user_email';
  static const String userRoleKey = 'user_role';
}