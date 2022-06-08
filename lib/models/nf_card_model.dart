import 'package:nft_marketplace_integration/helpers/extension.dart';
import 'package:nft_marketplace_integration/helpers/load_images.dart';
import 'package:equatable/equatable.dart';
import 'package:nft_marketplace_integration/helpers/random_string.dart';

class NFTCardModel extends Equatable{
  final String imageLink;
  final String collection;
  final String serialNumber;
  final String hash;
  final String owner;

  const NFTCardModel({
    required this.imageLink,
    required this.collection,
    required this.serialNumber,
    required this.owner,
    required this.hash
  });

  static Future<List<NFTCardModel>> getMockData() async {
    final List<String> files = await loadImages();
    return files.map((filePath) {
      return NFTCardModel(
        imageLink: filePath,
        collection: "Bored Ape",
        serialNumber: filePath.getFileName(),
        hash: getRandomStr(10),
        owner: "Hanri"
      );
    }).toList();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [imageLink, serialNumber];
}