import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/utils/color_pokemon_type.dart';
import 'package:pokedex_app/presentation/utils/string_utils.dart';

class TypeEffectRow extends StatelessWidget {
  final String? label; 
  final List<String> types; 

  const TypeEffectRow({super.key, 
     this.label,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    if (types.isEmpty) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: types.map((type) => TypeChip(type)).toList(),
        ),
        const SizedBox(height: 10), 
      ],
    );
  }
}

class TypeChip extends StatelessWidget {
  final String type;

  const TypeChip(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        color: Color(colorType(capitalize(type))),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        capitalize(type),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Color.fromARGB(209, 255, 255, 255),
        ),
      ),
    );
  }
}
