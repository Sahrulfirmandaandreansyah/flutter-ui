import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bid_tile_widget.dart';
import '../widgets/browse_tile_widget.dart';
import '../models/bid.dart';
import '../models/browse.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy
    final List<Bid> bids = [
      Bid(
        image:
            'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=3328&auto=format&fit=crop',
        title: "The Masa",
        ends: "35m 11s",
        price: "12.4",
      ),
      Bid(
        image:
            'https://images.unsplash.com/photo-1643101681441-0c38d714fa14?q=80&w=3432&auto=format&fit=crop',
        title: "Centre Piece",
        ends: "1h 2m",
        price: "8.2",
      ),
    ];

    final List<Browse> browseList = [
      Browse(
        image:
            "https://images.unsplash.com/photo-1636955840493-f43a02bfa064?q=80&w=3270&auto=format&fit=crop",
        title: "Vector",
        itemCount: 10000,
      ),
      Browse(
        image:
            "https://images.unsplash.com/photo-1639548206755-b20081a7cadc?q=80&w=3280&auto=format&fit=crop",
        title: "3D",
        itemCount: 1232,
      ),
      Browse(
        image:
            "https://images.unsplash.com/photo-1664959784172-fafcb579808b?q=80&w=3458&auto=format&fit=crop",
        title: "Vector",
        itemCount: 12312,
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFF5F7FA), Color(0xFFE8EAF6), Color(0xFFFCE4EC)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/User1.png'),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Akhyar AN',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Level 109',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/svgs/notification.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Popular Bids Section
                  const Text(
                    'Popular Bids',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemCount: bids.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 16),
                      itemBuilder:
                          (context, index) => BidTileWidget(bid: bids[index]),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Browse Section
                  const Text(
                    'Browse',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemCount: browseList.length,
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 16),
                      itemBuilder:
                          (context, index) =>
                              BrowseTileWidget(browse: browseList[index]),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _NavBarIcon(
                svgPath: 'assets/svgs/icon_discover.svg',
                label: 'Discover',
                active: true,
              ),
              _NavBarIcon(
                svgPath: 'assets/svgs/icon_history.svg',
                label: 'History',
              ),
              _NavBarIcon(
                svgPath: 'assets/svgs/icon_wishlist.svg',
                label: 'Wishlist',
              ),
              _NavBarIcon(
                svgPath: 'assets/svgs/icon_setting.svg',
                label: 'Setting',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final String svgPath;
  final String label;
  final bool active;
  const _NavBarIcon({
    required this.svgPath,
    required this.label,
    this.active = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          width: 24,
          height: 24,
          color: active ? const Color(0xFF2563EB) : Colors.black26,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: active ? const Color(0xFF2563EB) : Colors.black26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
