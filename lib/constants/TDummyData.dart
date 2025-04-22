import '../model/banner_model.dart';
import '../model/category_model.dart';
import '../router/router.dart';

class Tdummydata {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.order,
        active: false),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.cart,
        active: true),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.search,
        active: true),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: "assets/images/searching.png",
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        image: "assets/images/searching.png",
        name: 'Sports',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: "assets/images/searching.png",
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '3',
        image: "assets/images/searching.png",
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '4',
        image: "assets/images/searching.png",
        name: 'Clothes',
        isFeatured: true),
    CategoryModel(
        id: '5',
        image: "assets/images/searching.png",
        name: 'Animals',
        isFeatured: true),
    CategoryModel(
        id: '6',
        image: "assets/images/searching.png",
        name: 'Shoes',
        isFeatured: true),
    CategoryModel(
        id: '7',
        image: "assets/images/searching.png",
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '8',
        image: "assets/images/searching.png",
        name: 'Jewelry',
        isFeatured: true),

    // Subcategories
    CategoryModel(
        id: '9',
        image: "assets/images/searching.png",
        name: 'Sport Shoes',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: "assets/images/searching.png",
        name: 'Track suits',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '11',
        image: "assets/images/searching.png",
        name: 'Sports Equipments',
        parentId: '1',
        isFeatured: false),

    // Furniture subcategories
    CategoryModel(
        id: '12',
        image: "assets/images/searching.png",
        name: 'Bedroom furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: "assets/images/searching.png",
        name: 'Kitchen furniture',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '14',
        image: "assets/images/searching.png",
        name: 'Office furniture',
        parentId: '5',
        isFeatured: false),
  ];
}
