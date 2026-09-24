import '@testing-library/jest-dom/vitest';
import { render, screen } from '@testing-library/react';
import { describe, expect, it } from 'vitest';
import Home from './page';

describe('SharePoint replica shell', () => {
  it('renders the requested structural landmarks and primary content', () => {
    render(<Home />);

    expect(screen.getByText('SharePoint')).toBeInTheDocument();
    expect(
      screen.getByText('Strategic Innovation & Emerging Technology'),
    ).toBeInTheDocument();
    expect(
      screen.getByRole('navigation', { name: 'Primary navigation' }),
    ).toBeInTheDocument();
    expect(
      screen.getByRole('toolbar', { name: 'Page authoring toolbar' }),
    ).toBeInTheDocument();
    expect(screen.getByText('Product & Process Innovation')).toBeInTheDocument();
  });
});
