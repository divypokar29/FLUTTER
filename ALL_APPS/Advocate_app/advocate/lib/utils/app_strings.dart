enum AppLanguage { english, hindi, gujarati }

class AppStrings {
  static AppLanguage currentLanguage = AppLanguage.hindi;

  static Map<String, Map<AppLanguage, String>> _strings = {
    'app_title': {
      AppLanguage.english: 'Patel Associate',
      AppLanguage.hindi: 'पटेल एसोसिएट',
      AppLanguage.gujarati: 'પટેલ એસોસિએટ',
    },
    'clients': {
      AppLanguage.english: 'Clients',
      AppLanguage.hindi: 'क्लाइंट',
      AppLanguage.gujarati: 'ક્લાઈન્ટ',
    },
    'add_client': {
      AppLanguage.english: 'Add Client',
      AppLanguage.hindi: 'क्लाइंट जोड़ें',
      AppLanguage.gujarati: 'ક્લાઈન્ટ ઉમેરો',
    },
    'payments': {
      AppLanguage.english: 'Payments',
      AppLanguage.hindi: 'भुगतान',
      AppLanguage.gujarati: 'ચુકવણી',
    },
    'documents': {
      AppLanguage.english: 'Documents',
      AppLanguage.hindi: 'दस्तावेज़',
      AppLanguage.gujarati: 'દસ્તાવેજ',
    },
    'reminders': {
      AppLanguage.english: 'Reminders',
      AppLanguage.hindi: 'रिमाइंडर',
      AppLanguage.gujarati: 'રિમાઈન્ડર',
    },
    'dashboard': {
      AppLanguage.english: 'Dashboard',
      AppLanguage.hindi: 'डैशबोर्ड',
      AppLanguage.gujarati: 'ડેશબોર્ડ',
    },
    'client_name': {
      AppLanguage.english: 'Client Name',
      AppLanguage.hindi: 'क्लाइंट का नाम',
      AppLanguage.gujarati: 'ક્લાઈન્ટ નું નામ',
    },
    'phone': {
      AppLanguage.english: 'Phone Number',
      AppLanguage.hindi: 'फोन नंबर',
      AppLanguage.gujarati: 'ફોન નંબર',
    },
    'case_type': {
      AppLanguage.english: 'Case Type',
      AppLanguage.hindi: 'केस का प्रकार',
      AppLanguage.gujarati: 'કેસ નો પ્રકાર',
    },
    'total_fees': {
      AppLanguage.english: 'Total Fees (₹)',
      AppLanguage.hindi: 'कुल फीस (₹)',
      AppLanguage.gujarati: 'કુલ ફી (₹)',
    },
    'paid_amount': {
      AppLanguage.english: 'Paid Amount (₹)',
      AppLanguage.hindi: 'चुकाई राशि (₹)',
      AppLanguage.gujarati: 'ચૂકવેલ રકમ (₹)',
    },
    'pending_amount': {
      AppLanguage.english: 'Pending Amount',
      AppLanguage.hindi: 'बकाया राशि',
      AppLanguage.gujarati: 'બાકી રકમ',
    },
    'save': {
      AppLanguage.english: 'Save',
      AppLanguage.hindi: 'सहेजें',
      AppLanguage.gujarati: 'સાચવો',
    },
    'cancel': {
      AppLanguage.english: 'Cancel',
      AppLanguage.hindi: 'रद्द करें',
      AppLanguage.gujarati: 'રદ કરો',
    },
    'delete': {
      AppLanguage.english: 'Delete',
      AppLanguage.hindi: 'हटाएं',
      AppLanguage.gujarati: 'કાઢી નાખો',
    },
    'edit': {
      AppLanguage.english: 'Edit',
      AppLanguage.hindi: 'संपादित करें',
      AppLanguage.gujarati: 'સંપાદિત કરો',
    },
    'doc_name': {
      AppLanguage.english: 'Document Name',
      AppLanguage.hindi: 'दस्तावेज़ का नाम',
      AppLanguage.gujarati: 'દસ્તાવેજ નું નામ',
    },
    'doc_type': {
      AppLanguage.english: 'Document Type',
      AppLanguage.hindi: 'दस्तावेज़ प्रकार',
      AppLanguage.gujarati: 'દસ્તાવેજ પ્રકાર',
    },
    'original': {
      AppLanguage.english: 'Original',
      AppLanguage.hindi: 'मूल',
      AppLanguage.gujarati: 'મૂળ',
    },
    'copy': {
      AppLanguage.english: 'Copy',
      AppLanguage.hindi: 'प्रति',
      AppLanguage.gujarati: 'નકલ',
    },
    'with_advocate': {
      AppLanguage.english: 'With Advocate',
      AppLanguage.hindi: 'वकील के पास',
      AppLanguage.gujarati: 'વકીલ પાસે',
    },
    'taken_by_client': {
      AppLanguage.english: 'Taken by Client',
      AppLanguage.hindi: 'क्लाइंट ने लिया',
      AppLanguage.gujarati: 'ક્લાઈન્ટ લઈ ગયા',
    },
    'mark_taken': {
      AppLanguage.english: 'Mark as Taken (Get Signature)',
      AppLanguage.hindi: 'लिया हुआ मार्क करें (हस्ताक्षर लें)',
      AppLanguage.gujarati: 'લીધેલ ચિહ્નિત કરો (સહી લો)',
    },
    'signature_taken': {
      AppLanguage.english: 'Signature taken on',
      AppLanguage.hindi: 'हस्ताक्षर लिए गए',
      AppLanguage.gujarati: 'સહી લેવામાં આવી',
    },
    'add_document': {
      AppLanguage.english: 'Add Document',
      AppLanguage.hindi: 'दस्तावेज़ जोड़ें',
      AppLanguage.gujarati: 'દસ્તાવેજ ઉમેરો',
    },
    'add_payment': {
      AppLanguage.english: 'Add Payment',
      AppLanguage.hindi: 'भुगतान जोड़ें',
      AppLanguage.gujarati: 'ચુકવણી ઉમેરો',
    },
    'payment_date': {
      AppLanguage.english: 'Payment Date',
      AppLanguage.hindi: 'भुगतान की तारीख',
      AppLanguage.gujarati: 'ચુકવણી ની તારીખ',
    },
    'amount': {
      AppLanguage.english: 'Amount (₹)',
      AppLanguage.hindi: 'राशि (₹)',
      AppLanguage.gujarati: 'રકમ (₹)',
    },
    'note': {
      AppLanguage.english: 'Note',
      AppLanguage.hindi: 'नोट',
      AppLanguage.gujarati: 'નોંધ',
    },
    'payment_pending': {
      AppLanguage.english: 'Payment Pending',
      AppLanguage.hindi: 'भुगतान बकाया',
      AppLanguage.gujarati: 'ચુકવણી બાકી',
    },
    'payment_done': {
      AppLanguage.english: 'Fully Paid',
      AppLanguage.hindi: 'पूरा भुगतान हो गया',
      AppLanguage.gujarati: 'સંપૂર્ણ ચૂકવણી',
    },
    'total_clients': {
      AppLanguage.english: 'Total Clients',
      AppLanguage.hindi: 'कुल क्लाइंट',
      AppLanguage.gujarati: 'કુલ ક્લાઈન્ટ',
    },
    'total_pending': {
      AppLanguage.english: 'Total Pending',
      AppLanguage.hindi: 'कुल बकाया',
      AppLanguage.gujarati: 'કુલ બાકી',
    },
    'total_received': {
      AppLanguage.english: 'Total Received',
      AppLanguage.hindi: 'कुल प्राप्त',
      AppLanguage.gujarati: 'કુલ મળ્યા',
    },
    'pending_clients': {
      AppLanguage.english: 'Pending Clients',
      AppLanguage.hindi: 'बकाया क्लाइंट',
      AppLanguage.gujarati: 'બાકી ક્લાઈન્ટ',
    },
    'add_reminder': {
      AppLanguage.english: 'Add Reminder',
      AppLanguage.hindi: 'रिमाइंडर जोड़ें',
      AppLanguage.gujarati: 'રિમાઈન્ડર ઉમેરો',
    },
    'reminder_date': {
      AppLanguage.english: 'Reminder Date',
      AppLanguage.hindi: 'रिमाइंडर तारीख',
      AppLanguage.gujarati: 'રિમાઈન્ડર તારીખ',
    },
    'reminder_msg': {
      AppLanguage.english: 'Message',
      AppLanguage.hindi: 'संदेश',
      AppLanguage.gujarati: 'સંદેશ',
    },
    'language': {
      AppLanguage.english: 'Language',
      AppLanguage.hindi: 'भाषा',
      AppLanguage.gujarati: 'ભાષા',
    },
    'settings': {
      AppLanguage.english: 'Settings',
      AppLanguage.hindi: 'सेटिंग्स',
      AppLanguage.gujarati: 'સેટિંગ્સ',
    },
    'no_clients': {
      AppLanguage.english: 'No clients added yet',
      AppLanguage.hindi: 'अभी कोई क्लाइंट नहीं जोड़ा',
      AppLanguage.gujarati: 'હજુ કોઈ ક્લાઈન્ટ ઉમેર્યા નથી',
    },
    'no_documents': {
      AppLanguage.english: 'No documents added',
      AppLanguage.hindi: 'कोई दस्तावेज़ नहीं जोड़ा',
      AppLanguage.gujarati: 'કોઈ દસ્તાવેજ ઉમેર્યા નથી',
    },
    'no_payments': {
      AppLanguage.english: 'No payments recorded',
      AppLanguage.hindi: 'कोई भुगतान दर्ज नहीं',
      AppLanguage.gujarati: 'કોઈ ચુકવણી નોંધી નથી',
    },
    'no_reminders': {
      AppLanguage.english: 'No reminders set',
      AppLanguage.hindi: 'कोई रिमाइंडर नहीं',
      AppLanguage.gujarati: 'કોઈ રિમાઈન્ડર નહીં',
    },
    'client_details': {
      AppLanguage.english: 'Client Details',
      AppLanguage.hindi: 'क्लाइंट की जानकारी',
      AppLanguage.gujarati: 'ક્લાઈન્ટ ની વિગત',
    },
    'payment_history': {
      AppLanguage.english: 'Payment History',
      AppLanguage.hindi: 'भुगतान इतिहास',
      AppLanguage.gujarati: 'ચુકવણી ઈતિહાસ',
    },
    'confirm_delete': {
      AppLanguage.english: 'Confirm Delete',
      AppLanguage.hindi: 'हटाने की पुष्टि करें',
      AppLanguage.gujarati: 'કાઢી નાખવાની પુષ્ટિ કરો',
    },
    'delete_confirm_msg': {
      AppLanguage.english: 'Are you sure you want to delete this?',
      AppLanguage.hindi: 'क्या आप वाकई इसे हटाना चाहते हैं?',
      AppLanguage.gujarati: 'શું તમે ખરેખર આ કાઢી નાખવા ماgba?',
    },
    'address': {
      AppLanguage.english: 'Address',
      AppLanguage.hindi: 'पता',
      AppLanguage.gujarati: 'સરનામું',
    },
    'case_start_date': {
      AppLanguage.english: 'Case Start Date',
      AppLanguage.hindi: 'केस शुरू की तारीख',
      AppLanguage.gujarati: 'કેસ શરૂ ની તારીખ',
    },
    'active': {
      AppLanguage.english: 'Active',
      AppLanguage.hindi: 'सक्रिय',
      AppLanguage.gujarati: 'સક્રિય',
    },
    'closed': {
      AppLanguage.english: 'Closed',
      AppLanguage.hindi: 'बंद',
      AppLanguage.gujarati: 'બંધ',
    },
    'case_status': {
      AppLanguage.english: 'Case Status',
      AppLanguage.hindi: 'केस की स्थिति',
      AppLanguage.gujarati: 'કેસ ની સ્થિતિ',
    },
    'search_client': {
      AppLanguage.english: 'Search client...',
      AppLanguage.hindi: 'क्लाइंट खोजें...',
      AppLanguage.gujarati: 'ક્લાઈન્ટ શોધો...',
    },
  };

  static String get(String key) {
    return _strings[key]?[currentLanguage] ??
        _strings[key]?[AppLanguage.english] ??
        key;
  }
}
