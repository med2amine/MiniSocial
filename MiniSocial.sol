// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MiniSocial - Mini réseau social décentralisé
/// @notice Permet à n'importe quelle adresse de publier un message ;
///         l'adresse de l'auteur est enregistrée automatiquement.
/// @dev Atelier 3 - Smart Contract "Mini Réseau Social" en Solidity
contract MiniSocial {
    /// @notice Un message publié et l'adresse de son auteur
    struct Post {
        string message; // contenu du message
        address author; // adresse Ethereum de l'utilisateur qui a publié
    }

    /// @notice Tableau dynamique contenant tous les messages publiés
    Post[] public posts;

    /// @notice Publie un nouveau message
    /// @dev L'auteur est toujours msg.sender (l'appelant de la transaction)
    /// @param _message Le texte du message à publier
    function publishPost(string memory _message) public {
        posts.push(Post(_message, msg.sender));
    }

    /// @notice Retourne le message et l'auteur du post situé à l'index donné
    /// @dev Les index commencent à 0. Échoue (revert) si l'index n'existe pas.
    /// @param index Position du post dans le tableau posts
    /// @return Le message et l'adresse de l'auteur
    function getPost(uint index)
        public
        view
        returns (string memory, address)
    {
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    /// @notice Retourne le nombre total de messages publiés
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
