#!/usr/bin/env python3

# USAGE: python3 generate_ad_usernames.py usernames.txt

import sys

def generate_ad_pseudo(nom_complet):
    pseudonymes = []
    prenom, nom = nom_complet.split()
    
    results.append(prenom + nom)  # JohnSmith
    results.append(prenom + "." + nom)  # John.Smith
    results.append(prenom[0] + nom)  # JSmith
    results.append(prenom[0] + "." + nom)  # J.Smith
    results.append(prenom + nom[0])  # JohnS
    results.append(prenom + "_" + nom)  # John_Smith
    results.append(nom + prenom)  # SmithJohn
    results.append(nom + "." + prenom)  # Smith.John
    results.append(nom + prenom[0])  # SmithJ
    results.append(nom[0] + prenom)  # SJohn
    results.append(nom + "_" + prenom)  # Smith_John
    
    pseudonymes.append(prenom + nom + "2023") # JohnSmith2023
    pseudonymes.append(prenom + nom + "2024") # JohnSmith2024
    results.append(prenom[0] + nom + "2023")  # JSmith2023
    results.append(prenom[0] + nom + "2024")  # JSmith2024
    

    return results

if __name__ == "__main__":
    if not len(sys.argv) >= 2:
        sys.exit("USAGE: ./generate_ad_usernames.py usernames.txt")
    
    usernames_file = sys.argv[1]
    with open(usernames_file, "r") as f:
        usernames = f.read().split("\n")
    
    results = []
    for username in usernames:
        if not username:
            continue
        results.extend(generate_ad_pseudo(username))

    for result in results:
        print(result)
