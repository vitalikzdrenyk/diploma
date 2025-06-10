import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FloorPlanPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FloorPlanPage extends StatefulWidget {
  const FloorPlanPage({super.key});
  @override
  State<FloorPlanPage> createState() => _FloorPlanPageState();
}

class _FloorPlanPageState extends State<FloorPlanPage> {
  int currentUniversityIndex = 0;
  int currentFloor = 0;
  String? selectedRoom;
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, dynamic>> universities = [
    {
      "name": "Університет 1",
      "floors": [
        {
          "image": "assets/floorplan.png",
          "hitboxes": [
            {"name": "122", "leftPercent": 0.575, "topPercent": 0.320, "widthPercent": 0.08, "heightPercent": 0.23},
            {"name": "123", "leftPercent": 0.655, "topPercent": 0.320, "widthPercent": 0.135, "heightPercent": 0.23},
            {"name": "129а", "leftPercent": 0.605, "topPercent": 0.63, "widthPercent": 0.055, "heightPercent": 0.27},
            {"name": "129", "leftPercent": 0.662, "topPercent": 0.63, "widthPercent": 0.157, "heightPercent": 0.27},
            {"name": "130", "leftPercent": 0.821, "topPercent": 0.64, "widthPercent": 0.109, "heightPercent": 0.26},
            {"name": "142", "leftPercent": 0.935, "topPercent": 0.64, "widthPercent": 0.052, "heightPercent": 0.26},
            {"name": "114", "leftPercent": 0.903, "topPercent": 0.250, "widthPercent": 0.088, "heightPercent": 0.14},
            {"name": "113", "leftPercent": 0.903, "topPercent": 0.110, "widthPercent": 0.088, "heightPercent": 0.14},
            {"name": "115", "leftPercent": 0.903, "topPercent": 0.390, "widthPercent": 0.088, "heightPercent": 0.14},
          ]
        },
        {
          "image": "assets/floorplan2.png",
          "hitboxes": [
            {"name": "209", "leftPercent": 0.545, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.22},
            {"name": "210", "leftPercent": 0.600, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.27},
            {"name": "211", "leftPercent": 0.650, "topPercent": 0.65, "widthPercent": 0.06, "heightPercent": 0.27},
            {"name": "212", "leftPercent": 0.710, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.27},
            {"name": "213", "leftPercent": 0.760, "topPercent": 0.65, "widthPercent": 0.06, "heightPercent": 0.27},
            {"name": "214", "leftPercent": 0.820, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.27},
            {"name": "215", "leftPercent": 0.870, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.27},
            {"name": "216", "leftPercent": 0.930, "topPercent": 0.66, "widthPercent": 0.054, "heightPercent": 0.26},
            {"name": "217", "leftPercent": 0.905, "topPercent": 0.41, "widthPercent": 0.08, "heightPercent": 0.13},
            {"name": "218", "leftPercent": 0.905, "topPercent": 0.27, "widthPercent": 0.08, "heightPercent": 0.13},
            {"name": "219", "leftPercent": 0.905, "topPercent": 0.13, "widthPercent": 0.08, "heightPercent": 0.13},
            {"name": "223", "leftPercent": 0.710, "topPercent": 0.35, "widthPercent": 0.085, "heightPercent": 0.22},
            {"name": "224", "leftPercent": 0.655, "topPercent": 0.35, "widthPercent": 0.055, "heightPercent": 0.22},
            {"name": "225", "leftPercent": 0.600, "topPercent": 0.35, "widthPercent": 0.055, "heightPercent": 0.22},
            {"name": "226", "leftPercent": 0.545, "topPercent": 0.35, "widthPercent": 0.055, "heightPercent": 0.22},
          ]
        },
        {
          "image": "assets/floorplan3.png",
          "hitboxes": [
            {"name": "309", "leftPercent": 0.545, "topPercent": 0.65, "widthPercent": 0.055, "heightPercent": 0.21},
            {"name": "310", "leftPercent": 0.605, "topPercent": 0.65, "widthPercent": 0.058, "heightPercent": 0.27},
            {"name": "311", "leftPercent": 0.662, "topPercent": 0.65, "widthPercent": 0.05, "heightPercent": 0.27},
            {"name": "312", "leftPercent": 0.712, "topPercent": 0.65, "widthPercent": 0.06, "heightPercent": 0.27},
            {"name": "313", "leftPercent": 0.820, "topPercent": 0.65, "widthPercent": 0.112, "heightPercent": 0.27},
            {"name": "314", "leftPercent": 0.930, "topPercent": 0.66, "widthPercent": 0.054, "heightPercent": 0.20},
            {"name": "315", "leftPercent": 0.905, "topPercent": 0.26, "widthPercent": 0.08, "heightPercent": 0.28},
            {"name": "316", "leftPercent": 0.905, "topPercent": 0.13, "widthPercent": 0.08, "heightPercent": 0.13},
            {"name": "320", "leftPercent": 0.710, "topPercent": 0.35, "widthPercent": 0.108, "heightPercent": 0.21},
            {"name": "321", "leftPercent": 0.600, "topPercent": 0.35, "widthPercent": 0.112, "heightPercent": 0.21},
            {"name": "322", "leftPercent": 0.545, "topPercent": 0.35, "widthPercent": 0.055, "heightPercent": 0.21},
          ]
        },
      ],
    },
    {
      "name": "Університет 2",
      "floors": [
        {
          "image": "assets/univ2_floor1.png",
          "hitboxes": [
            {"name": "113", "leftPercent": 0.497, "topPercent": 0.06, "widthPercent": 0.045, "heightPercent": 0.12},
            {"name": "114", "leftPercent": 0.545, "topPercent": 0.06, "widthPercent": 0.042, "heightPercent": 0.12},
            {"name": "106", "leftPercent": 0.615, "topPercent": 0.62, "widthPercent": 0.055, "heightPercent": 0.15},
            {"name": "102", "leftPercent": 0.370, "topPercent": 0.75, "widthPercent": 0.028, "heightPercent": 0.12},
            {"name": "103", "leftPercent": 0.400, "topPercent": 0.75, "widthPercent": 0.030, "heightPercent": 0.12},
          ],
        },
        {
          "image": "assets/univ2_floor2.png",
          "hitboxes": [
            {"name": "212", "leftPercent": 0.615, "topPercent": 0.17, "widthPercent": 0.03, "heightPercent": 0.1},
            {"name": "211", "leftPercent": 0.618, "topPercent": 0.35, "widthPercent": 0.03, "heightPercent": 0.14},
            {"name": "201", "leftPercent": 0.308, "topPercent": 0.75, "widthPercent": 0.045, "heightPercent": 0.22},
          ],
        },
        {
          "image": "assets/univ2_floor3.png",
          "hitboxes": [
            {"name": "B312", "leftPercent": 0.450, "topPercent": 0.17, "widthPercent": 0.05, "heightPercent": 0.17},
            {"name": "B317", "leftPercent": 0.625, "topPercent": 0.17, "widthPercent": 0.03, "heightPercent": 0.23},
            {"name": "B316", "leftPercent": 0.625, "topPercent": 0.40, "widthPercent": 0.03, "heightPercent": 0.07},
            {"name": "B306", "leftPercent": 0.570, "topPercent": 0.68, "widthPercent": 0.027, "heightPercent": 0.18},
            {"name": "B307", "leftPercent": 0.600, "topPercent": 0.68, "widthPercent": 0.027, "heightPercent": 0.18},
            {"name": "B308", "leftPercent": 0.630, "topPercent": 0.68, "widthPercent": 0.029, "heightPercent": 0.18},
            {"name": "B309", "leftPercent": 0.660, "topPercent": 0.68, "widthPercent": 0.029, "heightPercent": 0.18},
            {"name": "B302", "leftPercent": 0.360, "topPercent": 0.82, "widthPercent": 0.029, "heightPercent": 0.15},
            {"name": "B303", "leftPercent": 0.390, "topPercent": 0.82, "widthPercent": 0.029, "heightPercent": 0.15},
            {"name": "B304", "leftPercent": 0.420, "topPercent": 0.82, "widthPercent": 0.029, "heightPercent": 0.15},
          ],
        },
        {
          "image": "assets/univ2_floor4.png",
          "hitboxes": [
            {"name": "400", "leftPercent": 0.290, "topPercent": 0.72, "widthPercent": 0.055, "heightPercent": 0.16},
            {"name": "401", "leftPercent": 0.290, "topPercent": 0.87, "widthPercent": 0.055, "heightPercent": 0.1},
            {"name": "403", "leftPercent": 0.377, "topPercent": 0.79, "widthPercent": 0.035, "heightPercent": 0.16},
            {"name": "405", "leftPercent": 0.485, "topPercent": 0.65, "widthPercent": 0.055, "heightPercent": 0.19},
            {"name": "411", "leftPercent": 0.449, "topPercent": 0.42, "widthPercent": 0.034, "heightPercent": 0.14},
            {"name": "412", "leftPercent": 0.449, "topPercent": 0.09, "widthPercent": 0.045, "heightPercent": 0.32},
            {"name": "413", "leftPercent": 0.500, "topPercent": 0.45, "widthPercent": 0.031, "heightPercent": 0.08},
            {"name": "414", "leftPercent": 0.532, "topPercent": 0.45, "widthPercent": 0.052, "heightPercent": 0.08},
            {"name": "416", "leftPercent": 0.632, "topPercent": 0.33, "widthPercent": 0.039, "heightPercent": 0.09},
            {"name": "417", "leftPercent": 0.632, "topPercent": 0.09, "widthPercent": 0.039, "heightPercent": 0.26},
            {"name": "405а", "leftPercent": 0.535, "topPercent": 0.65, "widthPercent": 0.037, "heightPercent": 0.19},
            {"name": "407", "leftPercent": 0.573, "topPercent": 0.65, "widthPercent": 0.033, "heightPercent": 0.19},
            {"name": "409", "leftPercent": 0.640, "topPercent": 0.65, "widthPercent": 0.032, "heightPercent": 0.19},
            {"name": "410", "leftPercent": 0.672, "topPercent": 0.65, "widthPercent": 0.035, "heightPercent": 0.19},
          ],
        },
      ],
    },
  ];

  void searchRoom(String query) {
    for (int uniIdx = 0; uniIdx < universities.length; uniIdx++) {
      final floors = universities[uniIdx]["floors"] as List<Map<String, dynamic>>;
      for (int floorIdx = 0; floorIdx < floors.length; floorIdx++) {
        final hitboxes = floors[floorIdx]["hitboxes"] as List<Map<String, dynamic>>;
        final matchingRooms = hitboxes.where(
          (box) => box["name"].toString().toLowerCase() == query.toLowerCase(),
        ).toList();

        if (matchingRooms.isNotEmpty) {
          setState(() {
            currentUniversityIndex = uniIdx;
            currentFloor = floorIdx;
            selectedRoom = matchingRooms.first["name"];
          });
          return;
        }
      }
    }
    setState(() {
      selectedRoom = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUniversity = universities[currentUniversityIndex];
    final floors = currentUniversity["floors"] as List<Map<String, dynamic>>;
    final currentFloorData = floors[currentFloor];
    final hitboxes = currentFloorData["hitboxes"] as List<Map<String, dynamic>>;
    final imagePath = currentFloorData["image"] as String;

    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<int>(
          value: currentUniversityIndex,
          dropdownColor: Colors.yellow,
          underline: const SizedBox(),
          style: const TextStyle(color: Colors.blue, fontSize: 18),
          items: List.generate(
            universities.length,
            (index) => DropdownMenuItem(
              value: index,
              child: Text(universities[index]["name"]),
            ),
          ),
          onChanged: (index) {
            setState(() {
              currentUniversityIndex = index!;
              currentFloor = 0;
              selectedRoom = null;
            });
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 180,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Пошук аудиторії",
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                ),
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    searchRoom(value.trim());
                  }
                },
              ),
            ),
          ),
          for (int i = 0; i < floors.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: i == currentFloor ? Colors.yellow[700] : Colors.grey[700],
                  foregroundColor: i == currentFloor ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    currentFloor = i;
                    selectedRoom = null;
                  });
                },
                child: Text('Поверх ${i + 1}'),
              ),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          final aspectRatio = 2048 / 661;
          
          // Розраховуємо розміри зображення щоб воно поміщалося в екран
          double imageWidth = screenWidth;
          double imageHeight = screenWidth / aspectRatio;
          
          if (imageHeight > screenHeight) {
            imageHeight = screenHeight;
            imageWidth = screenHeight * aspectRatio;
          }

          return InteractiveViewer(
            minScale: 0.8,
            maxScale: 4.0,
            constrained: false,
            child: Center(
              child: Container(
                width: imageWidth,
                height: imageHeight,
                child: Stack(
                  children: [
                    Image.asset(
                      imagePath,
                      width: imageWidth,
                      height: imageHeight,
                      fit: BoxFit.contain,
                    ),
                    for (var box in hitboxes)
                      Positioned(
                        left: box['leftPercent'] * imageWidth,
                        top: box['topPercent'] * imageHeight,
                        width: box['widthPercent'] * imageWidth,
                        height: box['heightPercent'] * imageHeight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRoom = box['name'];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedRoom == box['name']
                                  ? Colors.yellow.withOpacity(0.5)
                                  : Colors.transparent,
                              border: Border.all(color: Colors.yellow),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              box['name'],
                              style: TextStyle(
                                color: selectedRoom == box['name']
                                    ? Colors.black
                                    : Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}