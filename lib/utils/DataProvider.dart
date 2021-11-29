import 'package:flutter/material.dart';
import 'package:medicare/ui/components/clinicVisitComponent.dart';
import 'package:medicare/ui/components/confirmAppointmentComponent.dart';
import 'package:medicare/ui/components/doctorListComponent.dart';
import 'package:medicare/ui/components/hospitalListComponent.dart';
import 'package:medicare/ui/components/patientComponent.dart';
import 'package:medicare/ui/model/appointmentData.dart';
import 'package:medicare/ui/model/bookAppointmentData.dart';
import 'package:medicare/ui/model/covidData.dart';
import 'package:medicare/ui/model/deliveredData.dart';
import 'package:medicare/ui/model/departmentData.dart';
import 'package:medicare/ui/model/diseaseData.dart';
import 'package:medicare/ui/model/doctorData.dart';
import 'package:medicare/ui/model/inboxData.dart';
import 'package:medicare/ui/model/medicationData.dart';
import 'package:medicare/ui/model/newsData.dart';
import 'package:medicare/ui/model/notificationData.dart';
import 'package:medicare/ui/model/rrderSuccessData.dart';
import 'package:medicare/ui/model/orderTrackData.dart';
import 'package:medicare/ui/model/patientData.dart';
import 'package:medicare/ui/model/paymentData.dart';
import 'package:medicare/ui/model/profileCardData.dart';
import 'package:medicare/ui/model/serviceData.dart';
import 'package:medicare/ui/model/specialistData.dart';
import 'package:medicare/ui/model/topHospitalData.dart';
import 'package:medicare/ui/model/voucherData.dart';
import 'package:medicare/ui/model/walkThroughData.dart';
import 'package:medicare/ui/screens/bookAppointmentScreen.dart';
import 'package:medicare/ui/screens/covid19Screen.dart';
import 'package:medicare/ui/screens/diseaseScreen.dart';
import 'package:medicare/ui/screens/onlinePharmacyScreen.dart';
import 'package:medicare/ui/screens/videoCounsultScreen.dart';

import 'Image.dart';
import 'String.dart';

List<WalkThroughData> walkThroughDataList() {
  List<WalkThroughData> list = [];
  list.add(WalkThroughData(
      imagePath: slider_one, title: slide_one, subtitle: slide_one_subtitle));
  list.add(WalkThroughData(
      imagePath: slider_three,
      title: slide_three,
      subtitle: slide_three_subtitle));
  list.add(WalkThroughData(
      imagePath: slider_two, title: slide_two, subtitle: slide_two_subtitle));
  // list.add(MLWalkThroughData(imagePath: ml_ic_slide_four, title: mlSlide_four, subtitle: mlSlide_four_subtitle));
  return list;
}

List<ServicesData> serviceDataList() {
  List<ServicesData> list = [];
  list.add(ServicesData(
      title: 'Clinic Visit',
      icon: Icons.home_work_outlined,
      image: dashClinicVisit!,
      widget: BookAppointmentScreen(index: 0)));
  list.add(ServicesData(
      title: 'Home Visit',
      icon: Icons.home,
      image: dashHomeVisit,
      widget: BookAppointmentScreen(index: 0)));
  list.add(ServicesData(
      title: 'Video Consult',
      icon: Icons.video_call,
      image: dashVideoCons,
      widget: VideoConsultScreen()));
  list.add(ServicesData(
      title: 'Pharmacy',
      icon: Icons.local_hospital,
      image: dashPharmacy,
      widget: OnlinePharmacyScreen()));
  list.add(ServicesData(
      title: 'Diseases',
      icon: Icons.health_and_safety,
      image: dashDisease,
      widget: DiseaseScreen()));
  list.add(ServicesData(
      title: 'Covid-19',
      icon: Icons.supervised_user_circle_outlined,
      image: dashCovid,
      widget: CovidScreen()));
  return list;
}

List<DepartmentData> departmentDataList() {
  List<DepartmentData> list = [];
  list.add(DepartmentData(
      image: department_one, title: 'General Care', subtitle: '647 Doctor'));
  list.add(DepartmentData(
      image: department_two, title: 'Pediatrics', subtitle: '324 Doctor'));
  list.add(DepartmentData(
      image: department_three, title: 'Cardiologic', subtitle: '647 Doctor'));
  list.add(DepartmentData(
      image: department_one, title: 'General Care', subtitle: '647 Doctor'));
  list.add(DepartmentData(
      image: department_two, title: 'Pediatrics', subtitle: '324 Doctor'));
  list.add(DepartmentData(
      image: department_three, title: 'Cardiologic', subtitle: '647 Doctor'));
  return list;
}

List<TopHospitalData> topHospitalDataList() {
  List<TopHospitalData> list = [];
  list.add(TopHospitalData(
      image: hospital_one,
      title: 'General Doctor',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_two,
      title: 'Pediatrics',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_three,
      title: 'Cardiologic',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_four,
      title: 'General Doctor',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_one,
      title: 'General Doctor',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_two,
      title: 'Pediatrics',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_three,
      title: 'Cardiologic',
      subtitle: '647 Doctor',
      rating: ''));
  list.add(TopHospitalData(
      image: hospital_four,
      title: 'General Doctor',
      subtitle: '647 Doctor',
      rating: ''));
  return list;
}

List<BookAppointmentData> bookAppointmentDataList() {
  List<BookAppointmentData> list = [];
  list.add(BookAppointmentData(
      id: '1',
      title: 'Select Service',
      widget: ClinicVisitComponent(),
      progress: 0.2));
  list.add(BookAppointmentData(
      id: '2',
      title: 'Choose Hospital',
      widget: HospitalListComponent(),
      progress: 0.4));
  list.add(BookAppointmentData(
      id: '3',
      title: 'Choose Doctor',
      widget: DoctorListComponent(),
      progress: 0.6));
  list.add(BookAppointmentData(
      id: '4',
      title: 'Choose Patient',
      widget: PatientComponent(),
      progress: 0.8));
  list.add(BookAppointmentData(
      id: '5',
      title: 'Confirm Appointment',
      widget: ConfirmAppointmentComponent(),
      progress: 1.0));
  return list;
}

List<TopHospitalData> hospitalListDataList() {
  List<TopHospitalData> list = [];
  list.add(TopHospitalData(
      image: hospital_one,
      title: 'Johns Hokins Hospital',
      city: 'New York, NY',
      rating: '4.8 (456 Reviews)',
      fees: '\$350'));
  list.add(TopHospitalData(
      image: hospital_two,
      title: 'The NorthSide Hospital ',
      city: 'Central Hill',
      rating: '4.8 (456 Reviews)',
      fees: '\$750'));
  list.add(TopHospitalData(
      image: hospital_three,
      title: 'Johns Hokins Hospital',
      city: 'New York, NY',
      rating: '4.8 (456 Reviews)',
      fees: '\$350'));
  list.add(TopHospitalData(
      image: hospital_four,
      title: 'The NorthSide Hospital ',
      city: 'Central Hill',
      rating: '4.8 (456 Reviews)',
      fees: '\$750'));
  list.add(TopHospitalData(
      image: hospital_one,
      title: 'Johns Hokins Hospital',
      city: 'New York, NY',
      rating: '4.8 (456 Reviews)',
      fees: '\$350'));
  list.add(TopHospitalData(
      image: hospital_two,
      title: 'The NorthSide Hospital ',
      city: 'Central Hill',
      rating: '4.8 (456 Reviews)',
      fees: '\$750'));
  list.add(TopHospitalData(
      image: hospital_three,
      title: 'Johns Hokins Hospital',
      city: 'New York, NY',
      rating: '4.8 (456 Reviews)',
      fees: '\$350'));
  list.add(TopHospitalData(
      image: hospital_four,
      title: 'The NorthSide Hospital ',
      city: 'Central Hill',
      rating: '4.8 (456 Reviews)',
      fees: '\$750'));
  return list;
}

List<DepartmentData> serviceListDataList() {
  List<DepartmentData> list = [];
  list.add(DepartmentData(
      image: department_one,
      title: 'General Care',
      subtitle: '647 Doctor',
      price: "\$500-\$1000"));
  list.add(DepartmentData(
      image: department_two,
      title: 'Pediatrics',
      subtitle: '324 Doctor',
      price: "\$500-\$1000"));
  list.add(DepartmentData(
      image: department_three,
      title: 'Cardiologic',
      subtitle: '647 Doctor',
      price: "\$500-\$1000"));
  list.add(DepartmentData(
      image: department_one,
      title: 'General Care',
      subtitle: '647 Doctor',
      price: "\$500-\$1000"));
  list.add(DepartmentData(
      image: department_two,
      title: 'Pediatrics',
      subtitle: '324 Doctor',
      price: "\$500-\$1000"));
  list.add(DepartmentData(
      image: department_three,
      title: 'Cardiologic',
      subtitle: '647 Doctor',
      price: "\$500-\$1000"));
  return list;
}

List<DoctorData> doctorListDataList() {
  List<DoctorData> list = [];
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  list.add(DoctorData(
      title: 'Dr. Edward Jenner',
      subtitle: 'Endocrinology',
      image: doctor_image,
      rating: '4.8',
      fees: '\$450'));
  return list;
}

List<String?> scheduleTimeList() {
  List<String?> list = [];
  list.add('8:00 AM - 9:00 AM');
  list.add('9:00 AM - 10:00 AM');
  list.add('10:00 AM - 11:00 AM');
  list.add('11:00 AM - 12:00 AM');
  list.add('1:00 AM - 2:00 AM');
  list.add('2:00 AM - 3:00 AM');
  list.add('3:00 AM - 4:00 AM');
  list.add('4:00 AM - 5:00 AM');
  return list;
}

List<PatientData> patientDataList() {
  List<PatientData> list = [];
  list.add(
      PatientData(name: 'Kaixa Pham', dob: '21-09-1995', relation: 'label'));
  list.add(PatientData(
      name: 'Stephen Chew', dob: '12-11-1990', relation: 'Brother'));
  return list;
}

List<VoucherData> voucherDataList() {
  List<VoucherData> list = [];
  list.add(VoucherData(
      image: voucher,
      title: 'Deal -25% for General Care ',
      date: 'Exp: 21 April 2022'));
  list.add(VoucherData(
      image: voucher_two,
      title: 'Deal -10% for Pediatrics ',
      date: 'Exp: 18 April 2022'));
  return list;
}

List<PaymentData> mlPaymentDataList() {
  List<PaymentData> list = [];
  list.add(
      PaymentData(image: bank_payment_one, title: 'Payment at the clinic'));
  list.add(PaymentData(image: bank_payment_two, title: '**** **** **** 2109'));
  list.add(
      PaymentData(image: bank_payment_three, title: '**** **** **** 1210'));
  list.add(PaymentData(image: bank_payment_four, title: 'Kaixa Pham'));
  return list;
}

List<MedicationData> categoryMedicineList() {
  List<MedicationData> list = [];
  list.add(MedicationData(image: mediIconSix, title: 'Prescription Drug'));
  list.add(MedicationData(image: mediIconFive, title: 'Functional Food'));
  list.add(MedicationData(image: mediIconThree, title: 'Personal Care'));
  list.add(MedicationData(image: mediIconFour, title: 'Family Medicine'));
  list.add(MedicationData(image: mediIconTwo, title: 'Prescription Drug'));
  list.add(MedicationData(image: mediIconOne, title: 'Prescription Drug'));

  return list;
}

List<MedicationData> prescriptionMedicineDataList() {
  List<MedicationData> list = [];
  list.add(MedicationData(image: mediTwo, title: 'Vitamin C'));
  list.add(MedicationData(image: mediThree, title: 'General Health'));
  list.add(MedicationData(image: mediFour, title: 'Covid-19'));
  list.add(MedicationData(image: mediFive, title: 'Beauty'));
  list.add(MedicationData(image: mediTwo, title: 'Vitamin C'));
  list.add(MedicationData(image: mediThree, title: 'General Health'));
  return list;
}

List<DeliveredData> deliveredDataList() {
  List<DeliveredData> list = [];
  list.add(DeliveredData(
      imageOne: mediTwo,
      imageTwo: mediTwo,
      status: 'Pending',
      medicineOne: 'Apple Cinder Vinegar Goli',
      medicineTwo: 'High Potency Vitamin'));
  list.add(DeliveredData(
      imageOne: mediFour,
      imageTwo: mediThree,
      status: 'Processing',
      medicineOne: 'medicine',
      medicineTwo: 'medicine'));
  list.add(DeliveredData(
      imageOne: mediFive,
      imageTwo: mediFour,
      status: 'Pending',
      medicineOne: 'medicine',
      medicineTwo: 'medicine'));
  return list;
}

List<OrderSuccessData> mlOrderSuccessDataList() {
  List<OrderSuccessData> list = [];
  list.add(OrderSuccessData(title: 'Code Order', data: '#2995451'));
  list.add(OrderSuccessData(title: 'Estimated Time', data: '11:45 AM'));
  list.add(OrderSuccessData(
      title: 'An email confirmation will sent to', data: 'tmrw@gmail.com'));
  list.add(OrderSuccessData(title: 'Code Order', data: '#2995451'));
  list.add(OrderSuccessData(title: 'Estimated Time', data: '11:45 AM'));
  list.add(OrderSuccessData(
      title: 'An email confirmation will sent to', data: 'tmrw@gmail.com'));
  return list;
}

List<DiseaseData> diseaseDataList() {
  List<DiseaseData> list = [];
  list.add(
      DiseaseData(image: headacheDisease, title: 'Headache', subtitle: 'Head'));
  list.add(
      DiseaseData(image: toothDisease, title: 'Toothache', subtitle: 'Tooth'));
  list.add(DiseaseData(
      image: ThroatPainDisease, title: 'Throat Pain', subtitle: 'Throat'));
  list.add(DiseaseData(
      image: soreThroatDisease, title: 'Sore Throat', subtitle: 'Throat'));
  list.add(
      DiseaseData(image: headacheDisease, title: 'Headache', subtitle: 'Head'));
  list.add(
      DiseaseData(image: toothDisease, title: 'Toothache', subtitle: 'Tooth'));
  list.add(DiseaseData(
      image: ThroatPainDisease, title: 'Throat Pain', subtitle: 'Throat'));
  list.add(DiseaseData(
      image: soreThroatDisease, title: 'Sore Throat', subtitle: 'Throat'));
  return list;
}

List<SpecialistData> specialistDataDataList() {
  List<SpecialistData> list = [];
  list.add(SpecialistData(
      image: eye_specialist, title: 'Eye Care', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: bone_specialist, title: 'Bones', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: covid_specialist, title: 'Covid-19', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: heart_specialist, title: 'Heart', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: kidney_specialist, title: 'Kiddney', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: lungs_specialist, title: 'Lungs', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: tooth_specialist, title: 'Tooth', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: eye_specialist, title: 'Eye Care', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: bone_specialist, title: 'Bones', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: covid_specialist, title: 'Covid-19', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: heart_specialist, title: 'Heart', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: kidney_specialist, title: 'Kiddney', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: lungs_specialist, title: 'Lungs', subtitle: '647 Disease'));
  list.add(SpecialistData(
      image: tooth_specialist, title: 'Tooth', subtitle: '647 Disease'));
  return list;
}

List<CovidData> covidCasesDataList() {
  List<CovidData> list = [];
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  list.add(CovidData(country: 'US', active: '683k', death: '583k'));
  return list;
}

List<NewsData> covidNewsDataList() {
  List<NewsData> list = [];
  list.add(NewsData(
      image: hospital_four,
      title: 'Coronavirus: what\'s happing in Canada and around the world',
      duration: '18 min ago'));
  list.add(NewsData(
      image: hospital_one,
      title: 'India\'s Coronavirus death toll hits new record',
      duration: '18 min ago'));
  list.add(NewsData(
      image: hospital_three,
      title: 'India\'s Coronavirus death toll hits new record',
      duration: '18 min ago'));
  list.add(NewsData(
      image: hospital_two,
      title: 'India\'s Coronavirus death toll hits new record',
      duration: '18 min ago'));
  list.add(NewsData(
      image: hospital_one,
      title: 'India\'s Coronavirus death toll hits new record',
      duration: '18 min ago'));
  return list;
}

List<InboxData> mlInboxChatDataList() {
  List<InboxData> list = [];
  list.add(InboxData(id: 0, message: 'i have already taken medicine'));
  list.add(
      InboxData(id: 1, message: 'Hi Kaixa, have you taken your pills yet?'));
  list.add(
      InboxData(id: 1, message: 'sorry but i can\'t find your home number'));
  list.add(InboxData(id: 0, message: 'Please knock on dor'));
  list.add(InboxData(id: 0, message: 'I am home waiting for you'));
  list.add(InboxData(id: 0, message: 'Hi Miranda'));
  list.add(InboxData(id: 1, message: 'I am on my way to your home visit'));
  return list;
}

List<InboxData> mlBotChatDataList() {
  List<InboxData> list = [];
  list.add(InboxData(
      id: 1,
      message:
          'These are some of the frequantly asked question whencustomers use our services. Please '
          'choose the question you are intrested in'));
  list.add(InboxData(id: 0, message: 'yes'));
  list.add(InboxData(
      id: 1,
      message: 'Hi Kaixa, Thank you for using Medilab\'s consulting service.'
          'what are you intrested in our comprehensice checkup package?'));
  list.add(InboxData(id: 0, message: 'Get Started'));

  return list;
}

List<NotificationData> notificationDataList() {
  List<NotificationData> list = [];
  list.add(NotificationData(
      image: doctor_image,
      title:
          'an appointment has been scheduled” in context from reliable sources',
      time: '3m ago',
      status: 'Completed',
      detail: 'Completed'));
  list.add(NotificationData(
      image: doctor_image,
      title: 'Dr. sent you a message',
      time: '3m ago',
      status: ''));
  list.add(NotificationData(
      image: doctor_image,
      title: 'Vitamins are essential to human health. Here, l',
      time: 'Today at 2.20 AM',
      status: 'Canceled'));
  list.add(NotificationData(
      image: doctor_image,
      title:
          'Hey Dustin,. This email confirms your Service Name appointment on Appointment Date Time Client',
      time: 'Today at 11.20 AM',
      status: 'Delivered',
      detail: 'Succesfully delivered to you'));
  list.add(NotificationData(
    image: doctor_image,
    title:
        'Hey Dustin,. This email confirms your Service Name appointment on Appointment Date Time Client',
    time: '3m ago',
    status: 'Delivered',
  ));
  return list;
}

List<AppointmentData> appointmentDataList() {
  List<AppointmentData> list = [];
  list.add(AppointmentData(
      date: '10',
      month: 'october',
      doctor: 'Dr. Stephen Chew',
      department: 'General Care',
      patient: 'Kaixa Pham',
      service: 'Clinic Visit'));
  list.add(AppointmentData(
      date: '12',
      month: 'September',
      doctor: 'Dr. Stephen Chew',
      department: 'Pediatric',
      patient: 'Kaixa Pham ',
      service: 'Home Visit'));
  list.add(AppointmentData(
      date: '10',
      month: 'october',
      doctor: 'Dr. Stephen Chew',
      department: 'General Care',
      patient: 'Kaixa Pham ',
      service: 'Video Consult'));
  list.add(AppointmentData(
      date: '12',
      month: 'September',
      doctor: 'Dr. Stephen Chew',
      department: 'Pediatric',
      patient: 'Kaixa Pham ',
      service: 'Home Visit'));
  list.add(AppointmentData(
      date: '10',
      month: 'october',
      doctor: 'Dr. Stephen Chew',
      department: 'General Care',
      patient: 'Kaixa Pham ',
      service: 'Clinic Visit'));
  return list;
}

List<DeliveredData> deliveredStatusDataList() {
  List<DeliveredData> list = [];
  list.add(DeliveredData(
      imageOne: mediTwo,
      imageTwo: mediFive,
      status: 'Pending',
      medicineOne: 'Apple Cinder Vinegar Goli',
      medicineTwo: 'High Potency Vitamin'));
  list.add(DeliveredData(
      imageOne: mediThree,
      imageTwo: mediTwo,
      status: 'Processing',
      medicineOne: 'Apple Cinder Vinegar Goli',
      medicineTwo: 'medicine'));
  list.add(DeliveredData(
      imageOne: mediFour,
      imageTwo: mediFour,
      status: 'Pending',
      medicineOne: 'Apple Cinder Vinegar Goli',
      medicineTwo: 'medicine'));
  list.add(DeliveredData(
      imageOne: mediFive,
      imageTwo: mediThree,
      status: 'Pending',
      medicineOne: 'Apple Cinder Vinegar Goli',
      medicineTwo: 'medicine'));
  return list;
}

List<MedicationData> mlPillDataList() {
  List<MedicationData> list = [];
  list.add(MedicationData(image: mediFive, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediTwo, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediThree, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediFour, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediFive, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediTwo, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediThree, title: 'Probitic, 250mg'));
  list.add(MedicationData(image: mediFour, title: 'Probitic, 250mg'));
  return list;
}

List<OrderTrackData> orderTrackDataList() {
  List<OrderTrackData> list = [];
  list.add(OrderTrackData(
      date: '27 Sep',
      time: '09:30 AM',
      stage: 'Order Placed',
      message: 'your order #5465422212 is placed',
      value: true));
  list.add(OrderTrackData(
      date: '27 Sep',
      time: '16:30 PM',
      stage: 'Pending',
      message:
          'your order is pending for confirmation,your order is penging for confirmation',
      value: true));
  list.add(OrderTrackData(
      date: '27 Sep',
      time: '16:30 PM',
      stage: 'Confirmed',
      message: 'your order #5465422212 confirm,your order #5465422212 confirm',
      value: true));
  list.add(OrderTrackData(
      date: '27 Sep',
      time: '16:30 PM',
      stage: 'Processing',
      message:
          'your order #5465422212 Proccesing,your order #5465422212 Proccesing',
      value: true));
  list.add(OrderTrackData(
      date: 'Today',
      time: '16:30 PM',
      stage: 'Delivered',
      message: 'product delivery to you and marked as deliver',
      value: false));
  return list;
}

List<ProfileCardData> mlProfileDataList() {
  List<ProfileCardData> list = [];
  list.add(ProfileCardData(
      img: prescription1, name: 'Prescription', color: Colors.blueAccent));
  list.add(ProfileCardData(
      img: prescription2, name: 'Medical Record', color: Colors.orangeAccent));
  list.add(ProfileCardData(
      img: prescription3, name: 'Medical Test', color: Colors.pinkAccent));
  list.add(ProfileCardData(
      img: prescription4, name: 'Health Tracking', color: Colors.cyan));
  return list;
}
