import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/chuwol_scaffold.dart';
import '../../core/widgets/secondary_card.dart';

class AddFriendsSocialScreen extends StatelessWidget {
  const AddFriendsSocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChuwolScaffold(
      title: 'FRIENDS',
      backRoute: '/ranking',
      child: Column(
        children: const [
          SecondaryCard(
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.neonLime),
                SizedBox(width: 12),
                Text('친구 검색'),
              ],
            ),
          ),
          SizedBox(height: 12),
          SecondaryCard(child: Text('연락처 연동')),
          SizedBox(height: 12),
          SecondaryCard(child: Text('카카오톡 초대')),
          SizedBox(height: 18),
          SecondaryCard(child: Text('추천 타겟 · SEO RUNNER · +0.61km')),
        ],
      ),
    );
  }
}
