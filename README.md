# MiniSocial — Mini réseau social en Solidity

Smart contract « Mini Réseau Social » développé dans le cadre de l'**Atelier 3** (Pr. Ikram BEN ADBEL OUAHAB, 2026/2027).
Les utilisateurs peuvent publier des messages sur la blockchain ; le contrat enregistre l'adresse Ethereum de chaque auteur.

## Objectif

Implémenter, compiler, déployer sur un réseau de test (Sepolia) et tester un smart contract minimal qui permet :
- de publier un message (`publishPost`) ;
- de consulter un message et son auteur (`getPost`) ;
- de connaître le nombre total de messages (`getTotalPosts`).

## Outils et technologies

- Solidity `^0.8.20` (compilé avec la version : **[À COMPLÉTER : version choisie dans Remix]**)
- [Remix IDE](https://remix.ethereum.org/)
- MetaMask
- Réseau de test **Sepolia** (SepoliaETH, sans valeur réelle)

## Structure du projet

```text
MiniSocial/
├── MiniSocial.sol            # Le smart contract
├── README.md                 
└── report/
    ├── MiniSocial_Rapport.docx # Rapport détaillé (Word)
```

## Fonctions du contrat

| Élément | Signature | Rôle |
|---|---|---|
| Structure | `Post { string message; address author; }` | Un message et son auteur |
| Tableau | `Post[] public posts` | Stocke tous les messages |
| Écriture | `publishPost(string memory _message)` | Ajoute un `Post` avec `msg.sender` comme auteur (transaction) |
| Lecture | `getPost(uint index) public view returns (string memory, address)` | Retourne le message et l'auteur à l'index donné |
| Lecture | `getTotalPosts() public view returns (uint)` | Retourne `posts.length` |

## Ouvrir le contrat dans Remix

1. Aller sur https://remix.ethereum.org/
2. Dans l'explorateur de fichiers, créer `MiniSocial.sol` (ou importer le fichier du dépôt).
3. Coller / ouvrir le code du contrat.

## Compilation

Onglet **Solidity compiler** → choisir une version `0.8.20` ou supérieure → **Compile MiniSocial.sol**.

## Déploiement avec MetaMask sur Sepolia

1. Dans MetaMask, sélectionner le réseau **Sepolia** et s'assurer d'avoir un peu de SepoliaETH (faucet).
2. Dans Remix, onglet **Deploy & Run Transactions** → *Environment* : **Injected Provider - MetaMask**.
3. Vérifier que le réseau affiché est Sepolia et que le compte est le bon.
4. Contrat : `MiniSocial` → **Deploy** → confirmer la transaction dans MetaMask.

**Adresse du contrat déployé :** [À COMPLÉTER]
**Hash de la transaction de déploiement :** [À COMPLÉTER]

## Tests rapides

1. `getTotalPosts()` → `0`
2. Compte A : `publishPost("Hello from Account A")`
3. Changer de compte dans MetaMask, puis Compte B : `publishPost("Hello from Account B")`
4. `getTotalPosts()` → `2`
5. `getPost(0)` → message + adresse du compte A ; `getPost(1)` → message + adresse du compte B

Le détail des tests et des résultats figure dans le rapport : [`report/MiniSocial_Report.md`](report/MiniSocial_Report.md).

## Sécurité

Aucune clé privée, phrase de récupération ou mot de passe ne doit figurer dans ce dépôt.
Seuls l'adresse publique du contrat et les hash de transactions publics sont inclus.