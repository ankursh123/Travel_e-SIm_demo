import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_demo_persatation_1/app/utils/commonDimension.dart';
import '../../../app/config/colorPalette.dart';
import '../../../app/config/commonTextStyle.dart';
import '../../../data/core/Localize.dart';
import '../../bloc/cubit/globalESim/globalESimCubit.dart';
import '../../bloc/cubit/localESim/localESimCubit.dart';
import '../../bloc/cubit/regionalESim/regionalESimCubit.dart';
import '../../bloc/state/dataState.dart';
import '../../bloc/state/globalESimState.dart';
import '../../widgets/searchWidget.dart';
import '../dashboard/widgets/countryListItem.dart';
import '../dashboard/widgets/globaleSimCard.dart';
import '../dashboard/widgets/regionListItem.dart';

/// Created by Appinventiv  on [17-Aug-2023].
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  ///Variables
  late final tabController;
  late final mainTabController;

  ///LifeCycle Method - InitState
  @override
  void initState() {
    super.initState();
    initialSetup();
  }

  ///Initial Setup for UI and Loading Data from API and JSON.
  void initialSetup() {
    tabController = TabController(length: 2, vsync: this);
    mainTabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LocalESimCubit>().getCountryList();
      context.read<RegionalESimCubit>().getRegionList();
      context.read<GlobalESimCubit>().getESimData();
    });
  }

  ///Build Method.
  @override
  Widget build(BuildContext context) {
    ///Variable for App-Localization.
    return NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return customAppBar();
      },
      body: Column(
        children: [
          ///Obx to observe changes in objects.
                Expanded(
                    child: TabBarView(
                      controller: mainTabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        localESimView(),
                        regionalESimView(),
                        globalESimView(),
                      ],
                    ),
                  )

        ],
      ),
    );
  }

  ///Custom AppBar UI
  List<Widget> customAppBar() {
    return [
      SliverToBoxAdapter(
        child: AppBar(
            elevation: CommonDimension.dpZero,
            backgroundColor: ColorPalette.colorGrey900),
      ),
      SliverToBoxAdapter(
        child: Card(
          margin: EdgeInsets.zero,
          shadowColor: ColorPalette.black,
          clipBehavior: Clip.antiAlias,
          color: ColorPalette.colorGrey900,
          elevation: CommonDimension.dp10_0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CommonDimension.dpZero),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimension.dp16_0,
                ),
                child: Text(
                  Localize.instance.key.hello,
                  style: CommonTextStyle.heading.copyWith(
                    fontSize: CommonDimension.dp24_0,
                  ),
                  textScaleFactor: CommonDimension.dp1_0,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(
                  CommonDimension.dp16_0,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: CommonDimension.dp6_0),
                height: CommonDimension.dp40_0,
                decoration: BoxDecoration(
                    color: ColorPalette.colorDarkGrey,
                    borderRadius: BorderRadius.circular(CommonDimension.dp3_0)),
                child: searchTextField(),
              ),
              tabView(),
            ],
          ),
        ),
      ),
    ];
  }

  ///Search Text Field View
  Widget searchTextField() {
    return TextField(
        readOnly: true,
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return const SearchCountry();
              });
        },
        focusNode: null,
        maxLines: CommonDimension.dp1,
        style: CommonTextStyle.secondaryHeading, //
        decoration: InputDecoration(
            constraints: const BoxConstraints(
                maxHeight: CommonDimension.dpZero),
            hintText: Localize.instance.key.search,
            hintStyle: CommonTextStyle.secondaryHeading.copyWith(
                fontSize: CommonDimension.dp14_0,
                color: ColorPalette.colorGrey),
            border: InputBorder.none,
            prefixIconConstraints: const BoxConstraints(
                minWidth: CommonDimension.dp35_0),
            prefixIcon: const Icon(Icons.search,
                size: CommonDimension.dp20_0,
                color: ColorPalette.colorGrey)));
  }

  ///TabBar Setup View
  Widget tabView() {
    return Container(
      height: CommonDimension.dp60_0,
      padding: const EdgeInsets.only(
        left: CommonDimension.dp16_0,
        top: CommonDimension.dp10_0,
        bottom: CommonDimension.dp10_0,
        right: CommonDimension.dp16_0,
      ),
      child: TabBar(
        controller: mainTabController,
        physics: const NeverScrollableScrollPhysics(),
        labelStyle: CommonTextStyle.secondaryHeading.copyWith(
          fontSize: CommonDimension.dp12_0,
        ),
        indicator: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(CommonDimension.dp5_0)),
            color: ColorPalette.colorDarkGrey),
        labelColor: ColorPalette.white,
        unselectedLabelColor: ColorPalette.colorGrey,
        tabs: customTabs(),
      ),
    );
  }

  ///Tabs View
  List<Widget> customTabs() {
    return [
      Tab(
        child: Text(
          Localize.instance.key.localESim,
          textScaleFactor: CommonDimension.dp1_0,
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          Localize.instance.key.regionaleSIMs,
          textScaleFactor: CommonDimension.dp1_0,
          textAlign: TextAlign.center,
        ),
      ),
      Tab(
        child: Text(
          Localize.instance.key.globaleSIMs,
          textScaleFactor: CommonDimension.dp1_0,
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  ///Local ESim UI ListView.
  Widget localESimView() {
    return BlocBuilder<LocalESimCubit, DataState>(
      builder: (context, state){
        if(state is Loading){
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if(state is Error) {
          return const Center(
            child: Text("There is an error!"),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(
            left: CommonDimension.dp16_0,
            right: CommonDimension.dp16_0,
          ),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: context.read<LocalESimCubit>().countryList.length,
              itemBuilder: (_, index) => countryListTile(
                  context.read<LocalESimCubit>().countryList[index].name ?? "",
                  context.read<LocalESimCubit>().countryList[index].imageUrl ?? ""),
          ),
        );
    }
    );

  }

  ///Regional ESim UI ListView.
  Widget regionalESimView() {
    return BlocBuilder<RegionalESimCubit, DataState>(
        builder: (context, state){
          if(state is Loading){
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if(state is Error) {
            return const Center(
              child: Text("There is an error!"),
            );
          }
            return Padding(
              padding: const EdgeInsets.only(
                left: CommonDimension.dp16_0,
                right: CommonDimension.dp16_0,
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: context.read<RegionalESimCubit>().regionList.length,
                  itemBuilder: (_, index) => regionListTile(
                      context.read<RegionalESimCubit>().regionList[index].regionName ?? "",
                      context.read<RegionalESimCubit>().regionList[index].regionImage ?? ""),
              ),
          );
        });

  }

  ///Global ESim UI ListView.
  Widget globalESimView() {
    return BlocBuilder<GlobalESimCubit, GlobalESimState>(
      builder: (context, state) {
        if(state is ESimLoading){
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if(state is ESimError) {
          return const Center(
            child: Text("There is an error!"),
          );
        }
        else {
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: CommonDimension.dp20_0,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    CommonDimension.dp16_0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      CommonDimension.dp8_0,
                    ),
                    child: Container(
                      height: CommonDimension.dp36_0,
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                      ),
                      child: TabBar(
                        onTap: (int index) {
                          context.read<GlobalESimCubit>().showCallsAndText = index.isOdd;
                          context.read<GlobalESimCubit>().toggle();
                          // bool showData = Bool(index);
                        },
                        indicator: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                            ColorPalette.redAccent,
                            ColorPalette.pinkAccent,
                            ColorPalette.shade500,
                          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                        ),
                        controller: tabController,
                        tabs: [
                          Text(Localize.instance.key.data,
                              style: const TextStyle(
                                color: ColorPalette.white,
                              ),
                              textScaleFactor: CommonDimension.dp1_0),
                          Text(
                              "${Localize.instance.key.data}/${Localize.instance.key.calls}/${Localize.instance.key.text}",
                              textScaleFactor: CommonDimension.dp1_0),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: CommonDimension.dp20_0,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context.read<GlobalESimCubit>().simDATA.length,
                    itemBuilder: (_, index) => GlobalESimCard(
                      simData: context.read<GlobalESimCubit>().simDATA[index],
                    )),
                const SizedBox(
                  height: CommonDimension.dp20_0,
                ),
              ],
            ),
          );
        }
      },
    );
  }

}
