class AppURLS {
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Base & API URL~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  static const baseURL = "http://s.digitechinfra.com/public/api/";
  // static const baseURL = "https://smart.digitechinfra.com/public/api/";
  // static const baseURL = "http://smart.w3cloud.us/public/api/";
  static const baseImageURL = "http://s.digitechinfra.com/public/";
  // static const baseImageURL = "https://smart.digitechinfra.com/public/";
  // static const baseImageURL = "http://smart.w3cloud.us/public/";
  static const login = "${baseURL}auth/login";
  static const register = "${baseURL}auth/register";
  static const resetPassword = "${baseURL}reset/password?email=";
  static const getVendors = "${baseURL}all_vendors";
  static const getServices = "${baseURL}all_services";
  static const getEmergency = "${baseURL}getHelplines";
  static const getGateVisitor = "${baseURL}gate_updates";
  static const getGateParcel = "${baseURL}all_parcels";
  static const getGateHelper = "${baseURL}all_guests";
  static const getUnit = "${baseURL}get_unit_details/2/2";
  static const payBill = "${baseURL}set_bill_status/";
  static const generateQr = "${baseURL}visitor/qr?name=";
  static const getUser = "${baseURL}user";
  static const getStaff = "${baseURL}all_staff_members";
  static const allVisitors = "${baseURL}all-visitors";
  static const scanQr = "${baseURL}scan-qr/";
  static const allAnnouncements = "${baseURL}all_announcements";
  static const createAnnouncement = "${baseURL}create/announcement";
  static const announcementDelete = "${baseURL}announcement-delete/";
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
}
