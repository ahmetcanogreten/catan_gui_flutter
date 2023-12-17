import 'package:catan_gui_flutter/api/api_client.dart';
import 'package:catan_gui_flutter/features/game/resource.dart';
import 'package:catan_gui_flutter/features/lobby/models/room.dart';
import 'package:catan_gui_flutter/models/user.dart';

List<ResourceType> resourceTypes = [
  ResourceType.mountains,
  ResourceType.mountains,
  ResourceType.mountains,
  ResourceType.forest,
  ResourceType.forest,
  ResourceType.forest,
  ResourceType.forest,
  ResourceType.hills,
  ResourceType.hills,
  ResourceType.hills,
  ResourceType.fields,
  ResourceType.fields,
  ResourceType.fields,
  ResourceType.fields,
  ResourceType.pasture,
  ResourceType.pasture,
  ResourceType.pasture,
  ResourceType.pasture,
];

List<int> numbers = [2, 3, 3, 4, 4, 5, 5, 6, 6, 8, 8, 9, 9, 10, 10, 11, 11, 12];

List<Resource> createRandomOrderedResourceList() {
  resourceTypes.shuffle();
  numbers.shuffle();

  return [
    for (var i = 0; i < numbers.length; i++)
      Resource(
        index: i,
        type: resourceTypes[i],
        number: numbers[i],
      )
  ];
}

abstract interface class IRoomRepository {
  Future<Room> createRoom({required String name});

  Future<Room> getRoom({required int roomId});

  Future<Room> shuffleResourcesAndNumbers({required int roomId});

  Future<Room> addBot({required int roomId});
}

class BackendRoomRepository implements IRoomRepository {
  @override
  Future<Room> createRoom({required String name}) async {
    final orderedResources = [
      for (var i = 0; i < numbers.length; i++)
        {
          "index": i,
          "type": resourceTypes[i].toString().split('.').last,
          "number": numbers[i],
        }
    ];

    final response = await apiClient.post('/api/rooms',
        data: {'name': name, "resources": orderedResources});

    final data = response.data as Map<String, dynamic>;

    return Room.fromJson(data);
  }

  @override
  Future<Room> getRoom({required int roomId}) async {
    final response = await apiClient.get('/api/rooms/$roomId');

    final data = response.data as Map<String, dynamic>;

    return Room.fromJson(data);
  }

  @override
  Future<Room> shuffleResourcesAndNumbers({required int roomId}) async {
    final resources = createRandomOrderedResourceList();

    final response = await apiClient.patch('/api/rooms/$roomId', data: {
      "resources": [for (var resource in resources) resource.toJson()]
    });

    final data = response.data as Map<String, dynamic>;

    return Room.fromJson(data);
  }

  @override
  Future<Room> addBot({required int roomId}) async {
    final response = await apiClient.post('/api/rooms/$roomId/add-bot');

    final data = response.data as Map<String, dynamic>;

    return Room.fromJson(data);
  }
}

class MockRoomRepository implements IRoomRepository {
  late Room room;

  @override
  Future<Room> createRoom({required String name}) async {
    await Future.delayed(const Duration(seconds: 1));

    const user = User(
      id: "1",
      firstName: "Ahmet Can",
      lastName: "Öğreten",
      email: "ahmet.can@gmail.com",
    );

    room = const Room(
      id: 1,
      owner: user,
      users: [user],
      resources: [
        Resource(index: 0, type: ResourceType.hills, number: 2),
        Resource(index: 1, type: ResourceType.hills, number: 3),
        Resource(index: 2, type: ResourceType.hills, number: 3),
        Resource(index: 3, type: ResourceType.mountains, number: 4),
        Resource(index: 4, type: ResourceType.mountains, number: 4),
        Resource(index: 5, type: ResourceType.mountains, number: 5),
        Resource(index: 6, type: ResourceType.forest, number: 5),
        Resource(index: 7, type: ResourceType.forest, number: 6),
        Resource(index: 8, type: ResourceType.forest, number: 6),
        Resource(index: 9, type: ResourceType.forest, number: 8),
        Resource(index: 10, type: ResourceType.fields, number: 8),
        Resource(index: 11, type: ResourceType.fields, number: 9),
        Resource(index: 12, type: ResourceType.fields, number: 9),
        Resource(index: 13, type: ResourceType.fields, number: 10),
        Resource(index: 14, type: ResourceType.pasture, number: 10),
        Resource(index: 15, type: ResourceType.pasture, number: 11),
        Resource(index: 16, type: ResourceType.pasture, number: 11),
        Resource(index: 17, type: ResourceType.pasture, number: 12),
      ],
      code: "123456",
      gameStarted: false,
      name: "Room",
    );

    return room;
  }

  @override
  Future<Room> getRoom({required int roomId}) async {
    return room;
  }

  @override
  Future<Room> shuffleResourcesAndNumbers({required int roomId}) async {
    room = room.copyWith(resources: createRandomOrderedResourceList());

    return room;
  }

  @override
  Future<Room> addBot({required int roomId}) async {
    await Future.delayed(const Duration(seconds: 1));

    final usersCurrentlyInRoom = room.users;

    room = room.copyWith(users: [
      ...usersCurrentlyInRoom,
      User(
        id: "${usersCurrentlyInRoom.length}",
        firstName: "Bot",
        lastName: "${usersCurrentlyInRoom.length}",
        email: "",
      )
    ]);

    return room;
  }
}
