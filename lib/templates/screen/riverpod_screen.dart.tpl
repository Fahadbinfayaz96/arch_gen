import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/{{snake}}_provider.dart';

class {{Feature}}Screen extends StatelessWidget {
  const {{Feature}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch({{snake}}NotifierProvider);
        final notifier = ref.watch({{snake}}NotifierProvider.notifier);
        
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(child: Text(state.error!));
        }
        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(state.items[index].toString()));
          },
        );
      },
    );
  }
}