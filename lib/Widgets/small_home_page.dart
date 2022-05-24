import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nftapp/Widgets/customText.dart';
import 'package:nftapp/Widgets/header.dart';
import 'package:nftapp/constants/style.dart';
import 'package:nftapp/controllers/contract_controller.dart';
import 'package:nftapp/controllers/home_controller.dart';
import 'package:nftapp/helpers/dateTimeFormat.dart';

class SmallHomePage extends StatefulWidget {
  const SmallHomePage({Key? key}) : super(key: key);

  @override
  State<SmallHomePage> createState() => _SmallHomePageState();
}

class _SmallHomePageState extends State<SmallHomePage> {
  HomeController homeController = Get.put(HomeController());
  ContractController contractController = Get.put(ContractController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header(),
        Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Your Schedule Id'),
                  Obx(
                    () => CustomText(
                      text: homeController.walletConnect.value
                          ? contractController.currentScheduleID.value.toString()
                          : "'No Vesting Schedule Detected'",
                      color: textColorBlack,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Vested Amount'),
                  Obx(
                    () => CustomText(
                      text: homeController.walletConnect.value
                          ? '${contractController.vestedTotal.value.toString()} PPL (£####)'
                          : "0 PPL (£####)",
                      color: textColorBlack,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Fully Vested'),
                  Obx(
                    () => CustomText(
                      text: homeController.walletConnect.value
                          ? '${contractController.endTimeDays.value.toString()} Days'
                          : "0 Days",
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => CustomText2(
                      text: homeController.walletConnect.value
                          ? dateFormatter(contractController.scheduleEnd.value)
                          : "0 Days",
                      color: textColorGrey,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Withdrawable Amount'),
                  Obx(
                    () => CustomText(
                      text: homeController.walletConnect.value
                          ? '${contractController.currentAmountReleasable.value.toString()} PPL (£####)'
                          : "0 PPL",
                      color: textColorBlack,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Withdrawal Available in'),
                  Obx(
                    () => CustomText(
                      text: homeController.walletConnect.value
                          ? '${contractController.cliffEndDays.value.toString()} Days'
                          : "No ",
                      color: textColorBlack,
                    ),
                  ),
                  Obx(
                    () => CustomText2(
                      text:
                          homeController.walletConnect.value ? dateFormatter(contractController.cliff.value) : "0 Days",
                      color: textColorGrey,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}