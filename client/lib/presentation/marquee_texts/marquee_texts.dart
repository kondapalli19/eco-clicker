import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import '/theme.dart';

class MarqueeTexts extends StatelessWidget {
  final textList = [
    " ♻️ Recycling one aluminum can powers a 📺 TV for 3 hours. ",
    " Fashion industry 🏭 emits 10% of carbon. ",
    " Sources of pollution include 🏭industrial activities,🚌 transportation, 🍃agriculture, waste disposal, and 🌱 natural events.",
    " 💰 Investing in energy efficiency can lead to reduced consumption, lower costs, and minimized environmental impacts.🌎",
    " Solar Farm Efficiency 🚀Boosters: Increases energy production to +0.15/s",
    " One-third of global 🌎 food is lost yearly. ",
    " 🪴Sustainable practices save Dollar 12 trillion by 2030. ",
    " Over 8 million tons of plastic enter oceans 🌊 annually. ",
    " Average American produces 4.5 lbs trash 🗑️ daily. ",
    " Deforestation contributes 10% to carbon emissions. ",
    " Wind 🌬️ and solar are cheaper than fossil fuels. ",
    " Transportation 🚌 emits 25% of global greenhouse gases. ",
    " Great Pacific 🗑️ Garbage Patch equals 2x Texas. ",
    " 🌎 Only 1% of the Earth's water is freshwater 🌊, suitable for drinking.",
    " 👨 Humans use only 1% of all available water🌊. ",
    " 78% of marine mammals 🐳 are at risk of choking on plastic. ",
    " Americans throw away 25 trillion Styrofoam cups ☕ every year. ",
    " 🧻 Paper from trees🌲can be recycled 6 times. ",
    " Bamboo is the world's fastest growing plant.🍃 ",
    " Bees 🐝 dance to communicate. ",
    " The world's oldest trees 🌲 are 4,600 year old Bristlecone pines in the USA. ",
    " The EPA was formed because of Earth Day.🌎",
    " There's a flag 🚩 for Earth Day.🌎 ",
    " Agriculture 🍃 uses up 70% of our global freshwater. ",
    " ♻️ A modern glass bottle takes 4000 years or more to decompose. ",
    " 🍃 The five warmest years on record have occurred in the last decade. ",
    " Rainforests 🌲 are being cut down at the rate of 100 acres per minute. ",
    " This year’s theme for Earth Day 🌎 is “Climate Action.” ",
    " ♻️ It takes around 2,700 litres of water to make a single cotton t-shirt. ",
    " It takes almost 💧 5 Lakh litres of water to extract just 1 kg of gold. ",
    " Seaweed farming 🌱 is worth Dollar 7.7 billion globally. ",
    " LED lights 💡 use 75% less energy 🍃",
    " Native plants🍃 are low maintenance ",
    " Vegetable gardens 🌱 reduce greenhouse gases. ",
    " 🐛 Worms are combatting global warming.🌎 ",
    " Mangroves 🌲 help stop rising sea levels. ",
    " ♻️ Recycled glass products are helping reduce pollution. ",
    " 5% of the world’s pollution is made up of Americans.🌱",
    " The Amazon Rainforest🌲 produces 20% of the world's oxygen. ",
    " Approximately 80% of all plant 🌱 life is found in forests. ",
    " The Arctic is warming twice as fast as the 🌎 global average. ",
    " Urban trees 🌲 can reduce air temperature by up to 8 degrees Celsius. ",
    " Nearly 1 in 4 mammal 🦇 species is threatened with extinction. ",
    " A single teaspoon of soil 🌱 can contain billions of microorganisms.🐛 ",
    " The Sahara Desert 🏜️ expands about 0.6 miles (1 kilometer) every month. ",
    " Forests are home to 80% of the world's terrestrial biodiversity.🐛 ",
    " The Antarctic Ice Sheet holds about 70% of the world's fresh water.🌊 ",
    " Plastic bags can take up to 1,000 years to decompose 🐛 in landfills. ",
    " Certifications like ENERGY STAR ⭐ identify eco-friendly products. ",
    " ♻️ Recycling one million laptops saves energy. ",
    " Recycling ♻️ e-waste recovers valuable materials. ",
    " Informal e-waste recycling ♻️ poses health risks. ",
    " ♻️ Reduce ♻️ Reuse ♻️ Recycle ♻️ ",
  ];

  String getAllTexts() {
    return textList.join('          ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EcoColors.bgDark.withOpacity(0.8), // Background color with opacity
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: SizedBox(
          height: 20,
          child: Marquee(
            text: getAllTexts(),
            velocity: 30.0,
            pauseAfterRound: Duration(seconds: 1),
            style: TextStyle(color: Colors.white), // Text color set to white
          ),
        ),
      ),
    );
  }
}
