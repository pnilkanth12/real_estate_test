import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:real_estate_demo/core/app_colors.dart';
import 'package:real_estate_demo/core/app_images.dart';
import 'package:real_estate_demo/core/app_search_text_form_field.dart';
import 'package:real_estate_demo/core/app_text_style.dart';
import 'package:real_estate_demo/features/map/presentation/widgets/button_row.dart';


class MapPage extends StatefulWidget {
  const MapPage({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(59.944871, 30.385278),
    zoom: 14.4746,
  );

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  Set<Marker> setMarker = {};
  List<Map<String, dynamic>> json = [
    {
      'id': '1',
      'title': '10,3 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.944871,
      'longitude': 30.385278,
    },
    {
      'id': '2',
      'title': '7,8 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.947450,
      'longitude': 30.379656,
    },
    {
      'id': '3',
      'title': '11 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.954477,
      'longitude': 30.385450,
    },
    {
      'id': '4',
      'title': '13,3 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.9512,
      'longitude': 30.3909,
    },
    {
      'id': '5',
      'title': '8,5 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.942977,
      'longitude': 30.384559,
    },
    {
      'id': '6',
      'title': '6,95 mn \u20bd',
      'icon': Icons.apartment,
      'latitude': 59.943589,
      'longitude': 30.382993,
    }
  ];
  GlobalKey stackKey = GlobalKey();
  String selectedPopupValue = 'c';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    for (int i = 0; i < json.length; i++) {
      setMarker.addLabelMarker(LabelMarker(
        label: json[i]['title'],
        markerId: MarkerId(json[i]['id']),
        position: LatLng(json[i]['latitude'], json[i]['longitude']),
        icon: BitmapDescriptor.defaultMarker,
        textStyle: AppTextStyles.font16w500(context,
            fontSize: 40.sp, color: Colors.white),
        //     icon: await google.BitmapDescriptor.fromAssetImage(
        // const ImageConfiguration(devicePixelRatio: 10),
        //     'assets/images/map/pin.png'),
        backgroundColor: AppColors.primaryColor,
      ));
    }

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blocBody(context),
    );
  }

  Widget _blocBody(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition: MapPage._kGooglePlex,
          markers: setMarker,
          style: mapStyle,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        Positioned(bottom: 100.sp, child: const ButtonRowWidget()),
        _search(),
      ],
    );
  }

  Widget _search() {
    return Container(
      margin: EdgeInsets.only(top: 56.sp, left: 16.sp),
      child: Row(
        children: [
          Expanded(
            child: AppSearchTextFormField(
              maxLine: 1,
              controller: TextEditingController(),
              hints: const ['Search...'],
            ),
          ),
          Container(
            height: 50.sp,
            width: 50.sp,
            margin: EdgeInsets.only(left: 16.sp, right: 16.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.sp),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.all(18.sp),
              child: Image.asset(
                AppImages.settingsIcon,
                color: Colors.black,
                height: 24.sp,
                width: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String mapStyle='''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#212121"
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#181818"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#1b1b1b"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#2c2c2c"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#8a8a8a"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#373737"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#3c3c3c"
      }
    ]
  },
  {
    "featureType": "road.highway.controlled_access",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#4e4e4e"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#000000"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#3d3d3d"
      }
    ]
  }
]''';
