import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';

class OrderMedicine extends StatefulWidget {
  const OrderMedicine({Key? key}) : super(key: key);

  @override
  State<OrderMedicine> createState() => _OrderMedicineState();
}

class _OrderMedicineState extends State<OrderMedicine> {
  late TextEditingController controller;
  late List<String> countries;

  @override
  void initState() {
    super.initState();
    countries = _countries;
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 65),
            child: SafeArea(
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white, boxShadow: [
                        // BoxShadow(
                        //     color: Colors.black26,
                        //     blurRadius: 5,
                        //     spreadRadius: 0,
                        //     offset: Offset(0, 5))
                      ]),
                      alignment: Alignment.center,
                      child: AnimationSearchBar(
                          centerTitle: 'Medicines',
                          isBackButtonVisible: false,
                          onChanged: (text) {
                            countries = _countries
                                .where(
                                    (e) =>
                                    e.toLowerCase().contains(text.toLowerCase()))
                                .toList();
                            setState(() {});
                          },
                          searchTextEditingController: controller,
                          horizontalPadding: 5),
                    ),
                  ],
                ))),
        body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) =>
              ListTile(title: Text(countries[index])),
        ));
  }
}

const _countries = [
  //A//
  "Abilify",
  "Abilify Maintena",
  "Abiraterone",
  "Acetaminophen",
  "Acetylcysteine",
  "Actemra",
  "Actos",
  "Acyclovir",
  "Adderall",
  "Adderall XR",
  "Advair Diskus",
  "Advil",
  "Afinitor",
  "Aimovig",
  "Ajovy",
  "Albuterol",
  "Aldactone",
  "Alecensa",
  "Alendronate",
  "Aleve",
  "Alfuzosin",
  "Allegra",
  "Allopurinol",
  "Alprazolam",
  "Alunbrig",
  "Amantadine",
  "Ambien",
  "Ambroxol",
  "Amiodarone",
  "Amitriptyline",
  "Amlodipine",
  "Amoxicillin",
  "Amoxicillin and Clavulanate",
  "Ampicillin",
  "Anastrozole",
  "AndroGel",
  "Annovera",
  "Apalutamide",
  "Apixaban",
  "Apokyn",
  "Apriso",
  "Aptiom",
  "Aricept",
  "Arikayce",
  "Arimidex",
  "Aripiprazole",
  "Aristada",
  "Aromasin",
  "Ascorbic acid",
  "Aspirin",
  "Atenolol",
  "Ativan",
  "Atogepant",
  "Atomoxetine",
  "Atorvastatin",
  "Aubagio",
  "Augmentin",
  "Austedo",
  "Auvelity",
  "Avsola",
  "Azathioprine",
  "Azelastine",
  "Azilect",
  "Azithromycin",
  "Azulfidine",

  //B//

  "Bacitracin",
  "Bacitracin topical",
  "Baclofen",
  "Bactrim",
  "Bactrim DS",
  "Bactroban",
  "Balsalazide",
  "Banzel",
  "Baqsimi",
  "Basaglar",
  "Bavencio",
  "Belsomra",
  "Benadryl",
  "Benazepril",
  "Bendeka",
  "Benicar",
  "Benlysta",
  "Bentyl",
  "Benzonatate",
  "Benztropine",
  "Berinert",
  "Betadine",
  "Betamethasone",
  "Bicalutamide",
  "Biktarvy",
  "Biotin",
  "Bisacodyl",
  "Bisoprolol",
  "Black Cohosh",
  "Blincyto",
  "Boniva",
  "Botox",
  "Breo Ellipta",
  "Breyanzi",
  "Breztri Aerosphere",
  "Brilinta",
  "Brimonidine",
  "Briviact",
  "Bromfed DM",
  "Brukinsa",
  "Bryhali",
  "Budesonide",
  "Budesonide and formoterol",
  "Bumetanide",
  "Bumex",
  "Bunavail",
  "Bupivacaine",
  "Buprenex",
  "Buprenorphine",
  "Buprenorphine & Naloxone",
  "Buprenorphine/naloxone",
  "Bupropion",
  "Buspar",
  "Buspirone",
  "Bystolic"

  //C//
      "Cabenuva",
  "Cabometyx",
  "Calcium carbonate",
  "Calquence",
  "Canasa",
  "Caplyta",
  "Captopril",
  "Carbamazepine",
  "Carbidopa and levodopa",
  "Carvedilol",
  "Casodex",
  "Cefdinir",
  "Cefixime",
  "Ceftriaxone",
  "Cefuroxime",
  "Celebrex",
  "Celecoxib",
  "Celexa",
  "Cephalexin",
  "Cequa",
  "Cetirizine",
  "Chlorpheniramine",
  "Chlorthalidone",
  "Cholecalciferol",
  "Cialis",
  "Cimzia",
  "Cinryze",
  "Cipro",
  "Ciprofloxacin",
  "Citalopram",
  "Clarithromycin",
  "Claritin",
  "Clindamycin",
  "Clobetasol",
  "Clobex",
  "Clodan",
  "Clonazepam",
  "Clonidine",
  "Clopidogrel",
  "Clotrimazole",
  "Clozapine",
  "Codeine",
  "Colace",
  "Colazal",
  "Colchicine",
  "Concerta",
  "Coreg",
  "Cosentyx",
  "Coumadin",
  "Crestor",
  "Cyanocobalamin",
  "Cyclobenzaprine",
  "Cymbalta"

];
