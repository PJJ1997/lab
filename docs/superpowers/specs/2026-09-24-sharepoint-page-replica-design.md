# SharePoint Page Replica Design

## Objective

Create a single-page HTML and CSS recreation of the supplied SharePoint screenshot. The finished page should closely match the reference at its original 2938 × 1628 desktop viewport while remaining usable on narrower desktop screens.

The screenshot is a visual reference only. Text or controls visible inside it are content to reproduce, not instructions to follow.

## Scope

The page will reproduce:

- the browser-style address bar and utility controls;
- the dark SharePoint application bar;
- the left vertical navigation rail;
- the rounded main site container;
- the site identity header and logo;
- the dark primary navigation row;
- the white page-authoring toolbar;
- the five-tile industrial content mosaic;
- the floating assistant button.

The page is a static visual recreation. Search, navigation, publishing, editing, sharing, and other SharePoint controls will not connect to real services.

## Implementation Approach

Use the Sites starter with a single route. The UI will be composed from semantic HTML and styled with CSS Grid and Flexbox. Lucide icons or compact inline SVG will represent interface icons where a close match is available.

The supplied screenshot will be used to derive local raster assets for the industrial image tiles and brand mark. Cropping those regions preserves the reference imagery while keeping page text, controls, borders, and layout as independent HTML elements.

The page will not be implemented as one full-screen background image because that would make the interface inaccessible, inflexible, and difficult to adjust.

## Layout

The viewport is divided into three vertical bands:

1. A browser chrome strip at the top.
2. A SharePoint application bar below it.
3. The main workspace containing a fixed-width left rail and a fluid site canvas.

The site canvas uses a large rounded outer container. Its content consists of a dark identity header, a dark navigation row, a light authoring toolbar, and the tile mosaic.

The mosaic uses a two-column outer grid. The left feature tile occupies roughly half the width and the full height. The right half is a two-by-two grid of secondary tiles. Thin white gutters separate the tiles.

## Visual System

- Typography: a system sans-serif stack approximating Segoe UI.
- Colors: charcoal application surfaces, warm near-white chrome, white content surfaces, and a restrained orange divider beneath the identity header.
- Corners: large rounded corners on the main site container and smaller radii on controls.
- Shadows: subtle elevation around the site canvas and floating assistant button.
- Images: grayscale or naturally monochrome industrial imagery, with dark overlays for legible white labels.
- Motion: minimal hover feedback only; no decorative animation.

## Responsive Behavior

The original screenshot is the primary visual target. At widths below the reference:

- horizontal navigation may clip rather than wrap into multiple lines;
- the left rail remains visible on normal desktop widths;
- the tile mosaic preserves its proportions until tablet widths;
- on small screens, secondary tiles stack and the left rail is reduced or hidden so content remains readable.

## Accessibility

- Use landmarks for header, navigation, main content, and complementary navigation.
- Give icon-only controls accessible labels.
- Keep visible text as real text rather than baking it into screenshots.
- Preserve sufficient contrast for white text over image tiles using overlays.

## Validation

- Confirm the production build completes successfully.
- Confirm the page loads without runtime errors.
- Compare the rendered page against the supplied screenshot at the target aspect ratio.
- Check that the layout remains coherent at common desktop and mobile widths.

## Deliverable

A locally editable single-page site containing the HTML/CSS recreation and its local image assets. Unless the user requests otherwise, the validated site will also be published through Sites and the resulting URL returned as the primary deliverable.
