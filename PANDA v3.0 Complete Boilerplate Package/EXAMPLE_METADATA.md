# Metadata: ProductCard Component
> File: /src/components/ProductCard.tsx
> Created: 2025-01-28 14:30:00  
> Last Modified: 2025-01-28 16:45:00
> Last Modified By: [SHOP-005]

## Component Overview
**Purpose**: Displays a single product in a card format with image, title, price, and quick actions. Used in product grids and search results.
**Type**: Functional Component (React)
**Criticality**: Core - Required for product display throughout the application

## Dependencies

### Imports
```typescript
import React, { useState, useCallback, memo } from 'react';
import { Link } from 'react-router-dom';
import { Heart, ShoppingCart, Eye } from 'lucide-react';
import { useCart } from '../hooks/useCart';
import { useWishlist } from '../hooks/useWishlist';
import { ProductImage } from './ProductImage';
import { PriceDisplay } from './PriceDisplay';
import { RatingStars } from './RatingStars';
import { formatProductUrl } from '../utils/urls';
import { trackEvent } from '../utils/analytics';
import type { Product, ProductVariant } from '../types/product';
```

### External Dependencies
- `react`: ^18.2.0 - Core React functionality
- `react-router-dom`: ^6.8.0 - Navigation and routing
- `lucide-react`: ^0.263.1 - Icon components

### Internal Dependencies
- `useCart`: Shopping cart state management hook
- `useWishlist`: Wishlist state management  
- `ProductImage`: Lazy-loaded image component with fallback
- `PriceDisplay`: Formatted price with currency and discounts
- `RatingStars`: Product rating visualization
- `formatProductUrl`: URL generation utility
- `trackEvent`: Analytics event tracking

## Exports

### Default Export
```typescript
export default memo(ProductCard);
```

### Type Export
```typescript
export type ProductCardProps = {
  product: Product;
  variant?: ProductVariant;
  layout?: 'grid' | 'list';
  showQuickView?: boolean;
  onQuickView?: (product: Product) => void;
  className?: string;
};
```

## Integration Points

### State Management
- **Reads**: 
  - `cartItems` from CartContext
  - `wishlistItems` from WishlistContext  
  - `user` from AuthContext (for personalized pricing)
- **Writes**: 
  - `addToCart` action via useCart
  - `toggleWishlist` action via useWishlist
- **Local State**: 
  - `isHovered`: boolean - For hover effects
  - `imageIndex`: number - For image carousel
  - `isLoading`: boolean - For action states

### Events Emitted
- `product.viewed`: When card is clicked (analytics)
- `product.addedToCart`: When add to cart is clicked
- `product.addedToWishlist`: When wishlist is toggled
- `quickView.opened`: When quick view is triggered

### Events Handled  
- `onClick`: Navigate to product detail
- `onMouseEnter/Leave`: Hover state for image swap
- `onAddToCart`: Add product to cart with variant
- `onToggleWishlist`: Add/remove from wishlist
- `onQuickView`: Open quick view modal

### API Connections
None directly - receives data through props. Parent components handle API calls.

## Props Interface
```typescript
interface ProductCardProps {
  product: Product;              // Product data object
  variant?: ProductVariant;      // Pre-selected variant
  layout?: 'grid' | 'list';     // Display layout (default: 'grid')
  showQuickView?: boolean;       // Show quick view button (default: true)
  onQuickView?: (product: Product) => void; // Quick view handler
  className?: string;            // Additional CSS classes
}
```

## Error Handling
- **Image Loading**: Fallback image displayed on error
- **Price Calculation**: Defaults to base price if variant pricing fails
- **Cart Addition**: Toast notification on error, maintains UI state
- **Wishlist Toggle**: Optimistic update with rollback on failure
- **Navigation**: Prevents navigation if product URL is invalid

## Performance Considerations
- **Memoization**: Component wrapped in React.memo with custom comparison
- **Image Loading**: Lazy loaded with intersection observer
- **Event Handlers**: useCallback for stable references
- **Animations**: CSS transforms instead of JavaScript
- **Bundle Size**: Icons loaded individually, not entire set

## Testing Requirements
- **Unit Tests**: 
  - Renders with minimal props
  - Displays all product information correctly
  - Handles missing optional data gracefully
  - Click handlers called with correct arguments
- **Integration Tests**: 
  - Cart addition flow
  - Wishlist toggle persistence
  - Analytics events fired correctly
- **Visual Tests**: 
  - Grid and list layouts
  - Hover states
  - Loading states
- **Coverage Target**: 95% (Current: 92%)

## Accessibility
- **ARIA Labels**: 
  - "Add to cart" button
  - "Add to wishlist" button  
  - "View product details" link
- **Keyboard Navigation**: 
  - All interactive elements focusable
  - Tab order: Image → Title → Price → Actions
- **Screen Reader**: 
  - Product name announced
  - Price changes announced
  - Action results announced
- **Color Contrast**: 
  - Text: 7:1 ratio
  - Interactive elements: 4.5:1 ratio

## Security Considerations
- **XSS Prevention**: All product data sanitized before display
- **URL Validation**: Product URLs validated before navigation
- **Price Tampering**: Prices calculated server-side, display only
- **CSRF**: Cart actions include CSRF token

## Styling
- **CSS Module**: `/src/styles/ProductCard.module.css`
- **CSS Variables Used**:
  - `--color-primary`: Accent color
  - `--color-text`: Text color
  - `--spacing-unit`: Base spacing
  - `--border-radius`: Corner radius
- **Responsive Breakpoints**:
  - Mobile: <640px (single column)
  - Tablet: 640-1024px (2 columns)
  - Desktop: >1024px (3-4 columns)

## Related Files
- `/src/components/ProductCard.test.tsx` - Component tests
- `/src/components/ProductCard.stories.tsx` - Storybook stories
- `/src/styles/ProductCard.module.css` - Component styles
- `/src/components/ProductGrid.tsx` - Parent component
- `/src/components/QuickViewModal.tsx` - Quick view modal
- `/docs/components/ProductCard.md` - User documentation

## Performance Metrics
- **Render Time**: <16ms average
- **Memory Usage**: ~2.4KB per instance
- **Bundle Impact**: 4.2KB (minified + gzipped)
- **Lighthouse Score**: 98/100

## Change History
- [SHOP-005] - Initial component creation (2025-01-28)
- [SHOP-012] - Added wishlist functionality (2025-01-28)
- [SHOP-018] - Performance optimization with memo (2025-01-28)
- [SHOP-023] - Added quick view feature (2025-01-28)
- [SHOP-027] - Accessibility improvements (2025-01-28)

## Known Issues
- Image carousel on mobile needs swipe gestures ([SHOP-045])
- Quick view animation can stutter on low-end devices ([SHOP-046])

## Future Enhancements
- Add product comparison checkbox ([SHOP-089])
- Implement 360° image view ([SHOP-090])
- Add stock level indicator ([SHOP-091])

## Usage Example
```tsx
<ProductCard
  product={product}
  variant={selectedVariant}
  layout="grid"
  showQuickView={true}
  onQuickView={handleQuickView}
  className="featured-product"
/>
```

## Notes
- This component is used extensively throughout the application (300+ instances)
- Performance is critical as multiple instances render in product grids
- Maintains local hover state to prevent layout shift
- Follows atomic design principles - composed of smaller atoms

---
*This metadata is maintained by PANDA v3.0*
*Last automated scan: 2025-01-28 16:45:00*