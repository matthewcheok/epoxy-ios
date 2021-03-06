//  Created by Laura Skelton on 1/12/17.
//  Copyright © 2017 Airbnb. All rights reserved.

import EpoxyCore
import Foundation
import UIKit

// MARK: - ItemModeling

public protocol ItemModeling: ViewDifferentiatorProviding, DataIDProviding, Diffable {
  /// Returns this item model with its type erased to the `AnyItemModel` type.
  func eraseToAnyItemModel() -> AnyItemModel
}

// MARK: - InternalItemModeling

public protocol InternalItemModeling: ItemModeling,
  EpoxyModeled,
  SelectionStyleProviding,
  IsMovableProviding
{
  /// Configures the cell for presentation.
  func configure(cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Set behaviors needed by the view.
  ///
  /// Called before presentation and when cells are reordered.
  func setBehavior(cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Updates the cell based on a state change.
  func configureStateChange(in cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Handles the cell being selected.
  func handleDidSelect(_ cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Informs consumers that this item is about to be displayed.
  func handleWillDisplay(_ cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Informs consumers that this item is no longer displayed.
  func handleDidEndDisplaying(_ cell: ItemWrapperView, with metadata: ItemCellMetadata)

  /// Whether the cell should be selectable.
  var isSelectable: Bool { get }

  /// Creates view for this item. This should only be used to create a view outside of a collection
  /// view.
  ///
  /// - Parameter traitCollection: The trait collection to create the view for
  /// - Returns: The configured view for this item model.
  func configuredView(traitCollection: UITraitCollection) -> UIView
}
