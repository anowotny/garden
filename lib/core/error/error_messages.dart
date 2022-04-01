const String TOKEN_INVALID = "Sesja wygasła";
const String NO_TOKEN_FOUND = 'Unauthorized. No token found';
const String TOKEN_DELETED = 'User logged out';
const String SERVER_FAILURE = 'Błąd serwera';
const String CACHE_FAILURE = 'Błąd w zapisywaniu w pamieci podręcznej';
const String UNAUTHORIZED_FAILURE = 'Nie jesteś autoryzowany';
const String CREDENTIALS_REJECTED='Błędne dane logowania lub użytkownik o podanym adresie e-mail już istnieje';
const String BAD_REQUEST_FAILURE = 'Błędne dane';
const String NO_INTERNET_CONNECTION = 'Brak połączenia z internetem';
const String NOT_FOUND = 'Nie znaleziono';
const String SOCKET_FAILURE = 'Błąd połączenia';
const String TIMEOUT_FAILURE =
    'Przekroczono czas oczekiwania na odpowiedź serwera';
const String NO_SUCH_METHOD_ERROR = 'Niespodziewany błąd';
const LOADING_DATA_ERROR = 'Błąd w ładowaniu danych';
const CLIENT_FAILURE = 'Połączenie zostało przerwane podczas odczytu danych';
const PLATFORM_FAILURE='Błąd połączenia z serwisem zewnętrznym';
const NOT_FOUND_EXCEPTION='No data found';

const LOGIN_ERROR = 'Login error ocurred';
const NO_LOGIN_DATA = 'No login data received';
const EMAIL_INCORRECT = 'Podany adres email jest niepoprawny';
const NO_DATA_RECEIVED = 'Nie otrzymano danych';
const FB_GOOGLE_CANCELED = 'Autoryzacja została anulowana lub wystąpił błąd';

const USER_ALERADY_REGISTERED_ERROR = 'Użytkownik o podanym adresie e-mail już instnieje';
const INVALID_TOKEN_ERROR = 'token is invalid';
const USER_UNREGISTERED = 'user is unregistered';
const INCORRECT_ID = "Cached id is not relevant";

final Map<String, String> errorMessagesMap = {
  USER_ALERADY_REGISTERED_ERROR: "Użytkownik został już zarejestrowany",
  INVALID_TOKEN_ERROR: "Wystąpił błąd podczas rejestracji danych",
  USER_UNREGISTERED: "Użytkownik nie został jeszcze zarejestrowany"
};
