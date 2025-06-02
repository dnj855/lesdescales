# Les Dés'Calés Design System

*Board Game Association Website Style Guide*

## Color Palette

### Primary Colors

- **Primary Warm Orange** - #FF6B35 (Primary brand color for buttons, icons, and main emphasis)
- **Primary Deep Red** - #C1272D (Secondary brand color for important elements and navigation)

### Secondary Colors

- **Secondary Light Orange** - #FF8F65 (For hover states and secondary elements)
- **Secondary Soft Peach** - #FFF2EF (For backgrounds, selected states, and highlights)
- **Secondary Warm Yellow** - #FFB830 (For accents and complementary elements)

### Accent Colors

- **Accent Bright Orange** - #FF4500 (For call-to-action elements and important notifications)
- **Accent Golden Yellow** - #FFC107 (For highlights, badges, and special announcements)

### Functional Colors

- **Success Green** - #28A745 (For success states and confirmations)
- **Error Red** - #DC3545 (For errors and destructive actions)
- **Warning Orange** - #FD7E14 (For warnings and cautions)
- **Info Blue** - #17A2B8 (For informational elements)
- **Neutral Warm Gray** - #6C757D (For secondary text and disabled states)
- **Dark Charcoal** - #343A40 (For primary text and headings)

### Background Colors

- **Background Cream** - #FFFBF8 (Warm off-white for app background)
- **Background White** - #FFFFFF (Pure white for cards and content areas)
- **Background Light Peach** - #FDF6F3 (Subtle warm tint for sections)
- **Background Dark** - #2C1810 (For dark mode primary background)

## Typography

### Font Family

- **Primary Font**: Inter (Modern, clean, highly legible)
- **Accent Font**: Poppins (For headings and special emphasis)
- **Fallback**: system-ui, -apple-system, sans-serif

### Font Weights

- **Light**: 300
- **Regular**: 400
- **Medium**: 500
- **Semibold**: 600
- **Bold**: 700
- **Extra Bold**: 800

### Text Styles

### Headings

- **H1**: 32px/38px, Bold (700), Letter spacing -0.3px
    - Used for page titles and main headers
- **H2**: 28px/34px, Semibold (600), Letter spacing -0.2px
    - Used for section headers and major content blocks
- **H3**: 24px/30px, Semibold (600), Letter spacing -0.1px
    - Used for subsection headers and card titles
- **H4**: 20px/26px, Medium (500), Letter spacing 0px
    - Used for component headers and smaller sections

### Body Text

- **Body Large**: 18px/26px, Regular (400), Letter spacing 0px
    - Primary reading text for articles and main content
- **Body**: 16px/24px, Regular (400), Letter spacing 0px
    - Standard text for most UI elements and descriptions
- **Body Small**: 14px/20px, Regular (400), Letter spacing 0.1px
    - Secondary information and supporting text

### Special Text

- **Caption**: 12px/16px, Medium (500), Letter spacing 0.3px
    - Used for timestamps, metadata, and small labels
- **Button Text**: 16px/24px, Medium (500), Letter spacing 0.2px
    - Used specifically for buttons and interactive elements
- **Link Text**: 16px/24px, Medium (500), Letter spacing 0px, Primary Warm Orange
    - Clickable text throughout the application
- **Badge Text**: 13px/18px, Semibold (600), Letter spacing 0.2px
    - For status indicators and small informational badges

## Component Styling

### Buttons

- **Primary Button**
    - Background: Primary Warm Orange (#FF6B35)
    - Text: White (#FFFFFF)
    - Height: 48px
    - Corner Radius: 12px
    - Padding: 20px horizontal, 12px vertical
    - Shadow: 0 2px 8px rgba(255, 107, 53, 0.25)
- **Secondary Button**
    - Border: 2px Primary Warm Orange (#FF6B35)
    - Text: Primary Warm Orange (#FF6B35)
    - Background: Transparent
    - Height: 48px
    - Corner Radius: 12px
    - Padding: 18px horizontal, 10px vertical
- **Accent Button**
    - Background: Primary Deep Red (#C1272D)
    - Text: White (#FFFFFF)
    - Height: 48px
    - Corner Radius: 12px
    - Shadow: 0 2px 8px rgba(193, 39, 45, 0.25)
- **Text Button**
    - Text: Primary Warm Orange (#FF6B35)
    - No background or border
    - Height: 44px
    - Underline on hover

### Cards

- **Standard Card**
    - Background: White (#FFFFFF)
    - Shadow: 0 4px 16px rgba(0, 0, 0, 0.08)
    - Corner Radius: 16px
    - Padding: 24px
    - Border: 1px solid #F5F5F5
- **Featured Card**
    - Background: Background Light Peach (#FDF6F3)
    - Shadow: 0 6px 20px rgba(255, 107, 53, 0.15)
    - Corner Radius: 16px
    - Padding: 24px
    - Border: 2px solid Secondary Light Orange (#FF8F65)

### Input Fields

- **Standard Input**
    - Height: 56px
    - Corner Radius: 12px
    - Border: 2px Neutral Warm Gray (#6C757D)
    - Active Border: 2px Primary Warm Orange (#FF6B35)
    - Background: White (#FFFFFF)
    - Text: Dark Charcoal (#343A40)
    - Placeholder Text: Neutral Warm Gray (#6C757D)
    - Padding: 16px horizontal
- **Search Input**
    - Height: 48px
    - Corner Radius: 24px
    - Background: Background Light Peach (#FDF6F3)
    - Border: 1px transparent
    - Focus Border: 2px Primary Warm Orange (#FF6B35)

### Navigation

- **Primary Navigation**
    - Background: White (#FFFFFF)
    - Shadow: 0 2px 12px rgba(0, 0, 0, 0.06)
    - Active Link: Primary Warm Orange (#FF6B35)
    - Inactive Link: Dark Charcoal (#343A40)
    - Hover State: Secondary Light Orange (#FF8F65)

## Icons

- **Primary Icons**: 24px × 24px
- **Small Icons**: 20px × 20px
- **Large Icons**: 32px × 32px
- **Navigation Icons**: 28px × 28px
- **Primary color for interactive icons**: Primary Warm Orange (#FF6B35)
- **Secondary color for inactive icons**: Neutral Warm Gray (#6C757D)
- **Style**: Rounded, friendly, consistent stroke width (2px)

## Spacing System

- **2px** - Micro spacing (tight element relationships)
- **4px** - Tiny spacing (very close related elements)
- **8px** - Small spacing (internal component padding)
- **12px** - Compact spacing (close related groups)
- **16px** - Default spacing (standard margins and gaps)
- **24px** - Medium spacing (between content sections)
- **32px** - Large spacing (major section separation)
- **48px** - Extra large spacing (page-level margins)
- **64px** - Maximum spacing (major layout breaks)

## Motion & Animation

- **Micro Interactions**: 150ms, ease-in-out
    - Button hover states, icon changes
- **Standard Transitions**: 250ms, ease-out
    - Card hover effects, input focus states
- **Content Transitions**: 350ms, cubic-bezier(0.25, 0.46, 0.45, 0.94)
    - Page transitions, modal appearances
- **Emphasis Animations**: 400ms, spring (tension: 280, friction: 24)
    - Success confirmations, important notifications
- **Loading States**: 800ms, linear infinite
    - Skeleton loaders, progress indicators

## Accessibility Features

- **Focus States**: 3px Primary Warm Orange (#FF6B35) outline with 2px offset
- **Minimum Touch Target**: 44px × 44px
- **Contrast Ratios**:
    - Primary text: 7:1 minimum
    - Secondary text: 4.5:1 minimum
    - Interactive elements: 3:1 minimum
- **Reduced Motion**: Respect `prefers-reduced-motion` setting

## Dark Mode Variants

- **Dark Background**: #1A0F0A (warm dark primary background)
- **Dark Surface**: #2C1810 (card and content backgrounds)
- **Dark Primary Orange**: #FF8F65 (adjusted for contrast)
- **Dark Text Primary**: #F8F9FA
- **Dark Text Secondary**: #CED4DA
- **Dark Border**: #495057

## Board Game Specific Elements

- **Game Status Badges**
    - Available: Success Green background
    - Reserved: Warning Orange background
    - Unavailable: Neutral Warm Gray background
    - Corner radius: 20px, padding: 6px 12px
- **Event Cards**
    - Featured events: Accent Golden Yellow left border (4px)
    - Regular events: Standard card styling
    - Past events: Reduced opacity (0.7)
- **Member Interaction Elements**
    - Join buttons: Primary Button styling
    - Favorite icons: Accent Bright Orange when active
    - Share elements: Secondary Light Orange theming